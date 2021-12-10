import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/GetCultivarQuadraList.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomarList.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Telas/CultivarModule/ListPageCultivar.dart';
import 'package:updatetest_nulableversion/Telas/CultivarModule/UpdatePageCultivar.dart';
import 'package:updatetest_nulableversion/Telas/CultivarQuadraModule/DeletePageCultivarQuadra.dart';

class ListCultivaresQuadraPage extends StatefulWidget {
  final Quadra? idUsuario;

  ListCultivaresQuadraPage({Key? key, this.idUsuario}) : super(key: key);
  @override
  _ListCultivaresQuadraPageState createState() =>
      _ListCultivaresQuadraPageState(idUsuario);
}

class _ListCultivaresQuadraPageState extends State<ListCultivaresQuadraPage> {
  Future<List<CultivarQuadra>>? _futureCultivarQuadra;

  late Quadra quadra = new Quadra();
  late String id = "0";
  _ListCultivaresQuadraPageState(Quadra? idUsuario) {
    if (idUsuario != null) quadra = idUsuario;
    this.id = idUsuario!.id.toString();
  }

  @override
  void initState() {
    super.initState();
    if (id != "0")
      _futureCultivarQuadra = fetchCultivarQuadraList(id);
    else
      _futureCultivarQuadra = fetchCultivarQuadraList("0");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Cultivares Quadra',
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
                  builder: (context) => ListCultivarPage(
                    ativarBotoes: false,
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
          title: const Text('Lista de CultivaresQuadra'),
        ),
        body: Center(
          child: FutureBuilder<List<CultivarQuadra>>(
            future: _futureCultivarQuadra,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CultivarQuadra>? cultQuadras = snapshot.data;
                return ListView.builder(
                    itemCount: cultQuadras!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Wrap(
                          spacing: 12,
                          children: [
                            /*IconButton(
                              icon: Icon(
                                Icons.yard,
                                size: 30,
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListQuadrasPage(
                                        idUsuario: cultQuadras[index])),
                              ),
                            ),*/
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeletePageCultivarQuadra(
                                            idUsuario: cultQuadras[index]
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
                                    builder: (context) => UpdatePageCultivar(
                                        idUsuario:
                                            cultQuadras[index].id.toString())),
                              ),
                            ),
                          ],
                        ),
                        leading: Icon(Icons.account_circle, size: 40),
                        title: Text(cultQuadras[index].cultivar.nome!),
                        subtitle: Text(cultQuadras[index].quadra!.pomar!.nome!),
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
