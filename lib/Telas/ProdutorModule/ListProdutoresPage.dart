import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutorList.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/AddProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';

class ListProdutoresPage extends StatefulWidget {
  @override
  _ListProdutoresPageState createState() => _ListProdutoresPageState();
}

class _ListProdutoresPageState extends State<ListProdutoresPage> {
  Future<List<Produtor>>? _futureProdutor;

  @override
  void initState() {
    super.initState();
    _futureProdutor = fetchProdutorList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
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
                  builder: (context) => AddPage(),
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
          title: const Text('Lista de Produtores'),
        ),
        body: Center(
          child: FutureBuilder<List<Produtor>>(
            future: _futureProdutor,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Produtor>? produtores = snapshot.data;
                return ListView.builder(
                    itemCount: produtores!.length,
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
                                    builder: (context) => DeletePage(
                                        idUsuario: produtores[index]
                                            .idProdutor
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
                                    builder: (context) => UpdatePage(
                                        idUsuario: produtores[index]
                                            .idProdutor
                                            .toString())),
                              ),
                            ),
                          ],
                        ),
                        leading: Icon(Icons.account_circle, size: 40),
                        title: Text(produtores[index].nome),
                        subtitle: Text(produtores[index].email),
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
