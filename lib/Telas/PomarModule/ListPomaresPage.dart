import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomarList.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/ListTecnicoPage.dart';

import 'AddPagePomar.dart';
import 'DeletePagePomar.dart';
import 'UpdatePagePomar.dart';

class ListPomaresPage extends StatefulWidget {
  final Produtor? idUsuario;

  ListPomaresPage({Key? key, this.idUsuario}) : super(key: key);
  @override
  _ListPomaresPageState createState() => _ListPomaresPageState(idUsuario);
}

class _ListPomaresPageState extends State<ListPomaresPage> {
  Future<List<Pomar>>? _futurePomar;

  late Produtor produdor = new Produtor();
  late String id = "0";
  _ListPomaresPageState(Produtor? idUsuario) {
    if (idUsuario != null) produdor = idUsuario;
    this.id = idUsuario!.id.toString();
  }

  @override
  void initState() {
    super.initState();
    if (id != "0")
      _futurePomar = fetchPomarList(id);
    else
      _futurePomar = fetchPomarList("0");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Pomares',
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
                  builder: (context) => ListTecnicosPage(
                    ativarBotoes: false,
                    idProdutor: produdor,
                  ),
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
          title: const Text('Lista de Pomares'),
        ),
        body: Center(
          child: FutureBuilder<List<Pomar>>(
            future: _futurePomar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Pomar>? pomares = snapshot.data;
                return ListView.builder(
                    itemCount: pomares!.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                    builder: (context) => DeletePagePomar(
                                        idPomar: pomares[index].id.toString())),
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
                                    builder: (context) => UpdatePagePomar(
                                        id: pomares[index].id.toString())),
                              ),
                            ),
                          ],
                        ),
                        leading: Icon(Icons.account_circle, size: 40),
                        title: Text(pomares[index].nome),
                        subtitle: Text(pomares[index].cidade),
                      );
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
