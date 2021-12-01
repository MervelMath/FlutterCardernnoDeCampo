import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomarList.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/GetQuadra.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/GetQuadraList.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';
import 'package:updatetest_nulableversion/Telas/QuadraModule/AddPageQuadra.dart';
import 'package:updatetest_nulableversion/Telas/QuadraModule/DeletePageQuadra.dart';
import 'package:updatetest_nulableversion/Telas/QuadraModule/UpdatePageQuadra.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/ListTecnicoPage.dart';

class ListQuadrasPage extends StatefulWidget {
  final Pomar? idUsuario;

  ListQuadrasPage({Key? key, this.idUsuario}) : super(key: key);
  @override
  _ListPomarQuadrasPageState createState() =>
      _ListPomarQuadrasPageState(idUsuario);
}

class _ListPomarQuadrasPageState extends State<ListQuadrasPage> {
  Future<List<Quadra>>? _futureQuadra;

  late Pomar pomar = new Pomar();
  late String id = "0";
  _ListPomarQuadrasPageState(Pomar? idUsuario) {
    if (idUsuario != null) pomar = idUsuario;
    this.id = idUsuario!.id.toString();
  }

  @override
  void initState() {
    super.initState();
    if (id != "0")
      _futureQuadra = fetchQuadraList(id);
    else
      _futureQuadra = fetchQuadraList("0");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Quadras',
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
                  builder: (context) => AddPageQuadra(
                    idPomar: pomar,
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
          title: const Text('Lista de Quadras'),
        ),
        body: Center(
          child: FutureBuilder<List<Quadra>>(
            future: _futureQuadra,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Quadra>? quadras = snapshot.data;
                return ListView.builder(
                    itemCount: quadras!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Wrap(
                          spacing: 12,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.mode_outlined,
                                size: 30,
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdatePageQuadra(
                                        id: quadras[index].id.toString())),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeletePageQuadra(
                                        idQuadra:
                                            quadras[index].id.toString())),
                              ),
                            ),
                          ],
                        ),
                        leading: Icon(Icons.account_circle, size: 40),
                        title: Text(quadras[index].pomar.nome!),
                        subtitle: Text(
                            quadras[index].quantidadeColmeias.toString() +
                                "colméias"),
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
