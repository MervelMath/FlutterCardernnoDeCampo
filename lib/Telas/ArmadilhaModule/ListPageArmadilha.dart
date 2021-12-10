import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/GetArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/GetArmadilhaList.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomarList.dart';
import 'package:updatetest_nulableversion/Model/Armadilha.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Telas/ArmadilhaModule/AddPageArmadilha.dart';
import 'package:updatetest_nulableversion/Telas/ArmadilhaModule/DeletePageArmadilha.dart';
import 'package:updatetest_nulableversion/Telas/QuadraModule/ListPageQuadra.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/ListTecnicoPage.dart';

import 'UpdatePageArmadilha.dart';

class ListArmadilhasPage extends StatefulWidget {
  final Quadra? idUsuario;

  ListArmadilhasPage({Key? key, this.idUsuario}) : super(key: key);
  @override
  _ListArmadilhasPageState createState() => _ListArmadilhasPageState(idUsuario);
}

class _ListArmadilhasPageState extends State<ListArmadilhasPage> {
  Future<List<Armadilha>>? _futureArmadilha;

  late Quadra quadra = new Quadra();
  late String id = "0";
  _ListArmadilhasPageState(Quadra? idUsuario) {
    if (idUsuario != null) quadra = idUsuario;
    this.id = idUsuario!.id.toString();
  }

  @override
  void initState() {
    super.initState();
    if (id != "0")
      _futureArmadilha = fetchArmadilhaList(id);
    else
      _futureArmadilha = fetchArmadilhaList("0");
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
                  builder: (context) => AddPageArmadilha(
                    idQuadra: quadra,
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
          title: const Text('Lista de Armadilhas'),
        ),
        body: Center(
          child: FutureBuilder<List<Armadilha>>(
            future: _futureArmadilha,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Armadilha>? armadilhas = snapshot.data;
                return ListView.builder(
                    itemCount: armadilhas!.length,
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
                                    builder: (context) => DeletePageArmadilha(
                                        idArmadilha:
                                            armadilhas[index].id.toString())),
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
                                    builder: (context) => UpdatePageArmadilha(
                                        id: armadilhas[index].id.toString())),
                              ),
                            ),
                          ],
                        ),
                        leading: Icon(Icons.account_circle, size: 40),
                        title: Text(armadilhas[index].latitude.toString()),
                        subtitle: Text(armadilhas[index].quadra!.pomar!.nome!),
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
