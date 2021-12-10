import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/GetPragaList.dart';
import 'package:updatetest_nulableversion/Model/PragaModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Telas/PomarModule/AddPagePomar.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/AddPagePraga.dart';
import 'package:updatetest_nulableversion/Telas/PragaModule/DeletePagePraga.dart';

import 'UpdatePagePraga.dart';

class ListPragasPage extends StatefulWidget {
  final bool? ativarBotoes;
  final Produtor? idProdutor;
  ListPragasPage({Key? key, this.ativarBotoes, this.idProdutor})
      : super(key: key);
  @override
  _ListPragasPageState createState() =>
      _ListPragasPageState(ativarBotoes, idProdutor);
}

class _ListPragasPageState extends State<ListPragasPage> {
  Future<List<Praga>>? _futurePraga;
  late bool ativarCampos = false;
  late Produtor idProdutor = new Produtor();
  _ListPragasPageState(bool? ativarCampos, Produtor? idProdutor) {
    if (ativarCampos != null) this.ativarCampos = ativarCampos;
    if (idProdutor != null) this.idProdutor = idProdutor;
  }

  @override
  void initState() {
    super.initState();
    _futurePraga = fetchPragaList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mostrar Pragas',
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
                  builder: (context) => AddPagePraga(),
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
          title: const Text('Lista de Pragas'),
        ),
        body: Center(
          child: FutureBuilder<List<Praga>>(
            future: _futurePraga,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Praga>? pragas = snapshot.data;
                return ListView.builder(
                    itemCount: pragas!.length,
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
                                              pragas[index].id.toString())),
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
                                      builder: (context) => UpdatePagePraga(
                                          idUsuario:
                                              pragas[index].id.toString())),
                                ),
                              ),
                            ],
                          ),
                          title: Text(pragas[index].nome),
                        );
                      } else {
                        return ListTile(
                          trailing: Wrap(
                            spacing: 12,
                            children: [
                              /*IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPagePomar(
                                          idProdutor: idProdutor,
                                          idPraga: Pragas[index])),
                                ),
                              ),*/
                            ],
                          ),
                          title: Text(pragas[index].nome),
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
