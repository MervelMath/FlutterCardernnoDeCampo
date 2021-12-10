import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/GetCultivarList.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/GetPragaList.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Model/PragaModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Telas/CultivarModule/AddPageCultivar.dart';
import 'package:updatetest_nulableversion/Telas/CultivarModule/UpdatePageCultivar.dart';
import 'package:updatetest_nulableversion/Telas/PomarModule/AddPagePomar.dart';
import 'package:updatetest_nulableversion/Telas/PortaEnxertoModule/ListPagePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/AddPagePraga.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/DeletePagePraga.dart';

class ListCultivarPage extends StatefulWidget {
  final bool? ativarBotoes;
  final Quadra? idQuadra;
  ListCultivarPage({Key? key, this.ativarBotoes, this.idQuadra})
      : super(key: key);
  @override
  _ListCultivarPageState createState() =>
      _ListCultivarPageState(ativarBotoes, idQuadra);
}

class _ListCultivarPageState extends State<ListCultivarPage> {
  Future<List<Cultivar>>? _futureCultivar;
  late bool ativarCampos = false;
  late Quadra idQuadra = new Quadra();
  _ListCultivarPageState(bool? ativarCampos, Quadra? idQuadra) {
    if (ativarCampos != null) this.ativarCampos = ativarCampos;
    if (idQuadra != null) this.idQuadra = idQuadra;
  }

  @override
  void initState() {
    super.initState();
    _futureCultivar = fetchCultivarList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mostrar Cultivar',
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
                  builder: (context) => AddPageCultivar(),
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
          title: const Text('Lista de Cultivares'),
        ),
        body: Center(
          child: FutureBuilder<List<Cultivar>>(
            future: _futureCultivar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Cultivar>? cultivares = snapshot.data;
                return ListView.builder(
                    itemCount: cultivares!.length,
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
                                          idUsuario:
                                              cultivares[index].id.toString())),
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
                                      builder: (context) => UpdatePageCultivar(
                                          idUsuario:
                                              cultivares[index].id.toString())),
                                ),
                              ),
                            ],
                          ),
                          title: Text(cultivares[index].nome!),
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
                                    builder: (context) => ListPortaEnxertoPage(
                                        ativarBotoes: false,
                                        idQuadra: idQuadra,
                                        idCultivar: cultivares[index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(cultivares[index].nome!),
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
