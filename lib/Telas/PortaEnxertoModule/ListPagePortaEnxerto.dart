import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/GetPortaEnxertoList.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxertoModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Telas/CultivarQuadraModule/AddPageCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Telas/PortaEnxertoModule/AddPagePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Telas/PortaEnxertoModule/UpdatePagePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/AddPagePraga.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/DeletePagePraga.dart';

class ListPortaEnxertoPage extends StatefulWidget {
  final bool? ativarBotoes;
  final Quadra? idQuadra;
  final Cultivar? idCultivar;
  ListPortaEnxertoPage(
      {Key? key, this.ativarBotoes, this.idQuadra, this.idCultivar})
      : super(key: key);
  @override
  _ListPortaEnxertoPageState createState() =>
      _ListPortaEnxertoPageState(ativarBotoes, idQuadra, idCultivar);
}

class _ListPortaEnxertoPageState extends State<ListPortaEnxertoPage> {
  Future<List<PortaEnxerto>>? _futurePortaEnxerto;
  late bool ativarCampos = false;
  late Quadra idQuadra = new Quadra();
  late Cultivar idCultivar = new Cultivar();

  _ListPortaEnxertoPageState(
      bool? ativarCampos, Quadra? idQuadra, Cultivar? idCultivar) {
    if (ativarCampos != null) this.ativarCampos = ativarCampos;
    if (idQuadra != null) this.idQuadra = idQuadra;
    if (idCultivar != null) this.idCultivar = idCultivar;
  }

  @override
  void initState() {
    super.initState();
    _futurePortaEnxerto = fetchPortaEnxertoList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mostrar Porta Enxertos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPagePortaEnxerto(),
                ),
              ),
              icon: Icon(
                Icons.person_add,
                size: 30,
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Lista de Porta Enxertos'),
        ),
        body: Center(
          child: FutureBuilder<List<PortaEnxerto>>(
            future: _futurePortaEnxerto,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PortaEnxerto>? portaEnxertos = snapshot.data;
                return ListView.builder(
                    itemCount: portaEnxertos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (ativarCampos == true) {
                        return ListTile(
                          trailing: Wrap(
                            spacing: 12,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeletePagePraga(
                                          idUsuario: portaEnxertos[index]
                                              .id
                                              .toString())),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mode_outlined,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatePagePortaEnxerto(
                                              idUsuario: portaEnxertos[index]
                                                  .id
                                                  .toString())),
                                ),
                              ),
                            ],
                          ),
                          title: Text(portaEnxertos[index].nome!),
                        );
                      } else {
                        return ListTile(
                          trailing: Wrap(
                            spacing: 12,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddPageCultivarQuadra(
                                              idQuadra: idQuadra,
                                              idCultivar: idCultivar,
                                              idPortaEnxerto:
                                                  portaEnxertos[index])),
                                ),
                              ),
                            ],
                          ),
                          title: Text(portaEnxertos[index].nome!),
                        );
                      }
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
