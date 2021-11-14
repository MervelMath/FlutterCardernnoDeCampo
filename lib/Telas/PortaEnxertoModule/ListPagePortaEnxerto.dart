import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/GerPortaEnxertoList.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutorList.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxerto.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Telas/PomarModule/ListPomaresPage.dart';
import 'package:updatetest_nulableversion/Telas/PortaEnxertoModule/AddPagePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Telas/PortaEnxertoModule/UpdatePagePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/AddPageProdutor.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';

import 'DeletePagePortaEnxerto.dart';

class ListPagePortaEnxerto extends StatefulWidget {
  @override
  _ListPagePortaEnxertoState createState() => _ListPagePortaEnxertoState();
}

class _ListPagePortaEnxertoState extends State<ListPagePortaEnxerto> {
  Future<List<PortaEnxerto>>? _futurePortaEnxerto;

  @override
  void initState() {
    super.initState();
    _futurePortaEnxerto = fetchPortaEnxertoList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Porta Enxerto',
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
                List<PortaEnxerto>? produtores = snapshot.data;
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
                                      builder: (context) =>
                                          DeletePagePortaEnxerto(
                                              idUsuario: produtores[index]
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
                                              idUsuario: produtores[index]
                                                  .id
                                                  .toString())),
                                ),
                              ),
                            ],
                          ),
                          leading: Icon(Icons.account_circle, size: 40),
                          title: Text(produtores[index].nome));
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
