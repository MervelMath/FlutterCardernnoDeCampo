import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/GetCultivarList.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Telas/CultivarModule/AddPageCultivar.dart';

import 'DeletePageCultivar.dart';
import 'UpdatePageCultivar.dart';

class ListPageCultivar extends StatefulWidget {
  @override
  _ListPageCultivarState createState() => _ListPageCultivarState();
}

class _ListPageCultivarState extends State<ListPageCultivar> {
  Future<List<Cultivar>>? _futureCultivar;

  @override
  void initState() {
    super.initState();
    _futureCultivar = fetchCultivarList();
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
          title: const Text('Lista de Porta Enxertos'),
        ),
        body: Center(
          child: FutureBuilder<List<Cultivar>>(
            future: _futureCultivar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Cultivar>? produtores = snapshot.data;
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
                                      builder: (context) => DeletePageCultivar(
                                          idUsuario:
                                              produtores[index].id.toString())),
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
                                              produtores[index].id.toString())),
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
