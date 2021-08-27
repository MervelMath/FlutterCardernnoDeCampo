import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnicoList.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/AddPageTecnico.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/DeletePageTecnico.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/UpdatePageTecnico.dart';

class ListTecnicosPage extends StatefulWidget {
  @override
  _ListTecnicosPageState createState() => _ListTecnicosPageState();
}

class _ListTecnicosPageState extends State<ListTecnicosPage> {
  Future<List<ResponsavelTecnico>>? _futureTecnico;

  @override
  void initState() {
    super.initState();
    _futureTecnico = fetchTecnicoList();
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
                  builder: (context) => AddPageTecnico(),
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
          title: const Text('Lista de Responsáveis Técnicos'),
        ),
        body: Center(
          child: FutureBuilder<List<ResponsavelTecnico>>(
            future: _futureTecnico,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ResponsavelTecnico>? tecnicos = snapshot.data;
                return ListView.builder(
                    itemCount: tecnicos!.length,
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
                                    builder: (context) => DeletePageTecnico(
                                        idUsuario: tecnicos[index]
                                            .idRespTecnico
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
                                    builder: (context) => UpdatePageTecnico(
                                        idUsuario: tecnicos[index]
                                            .idRespTecnico
                                            .toString())),
                              ),
                            ),
                          ],
                        ),
                        title: Text(tecnicos[index].nome),
                        subtitle: Text(tecnicos[index].email),
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
