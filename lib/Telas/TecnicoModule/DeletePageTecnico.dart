import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/DeleteTecnico.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

class DeletePageTecnico extends StatefulWidget {
  final String? idUsuario;

  DeletePageTecnico({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePageTecnicoState createState() => _DeletePageTecnicoState(idUsuario!);
}

class _DeletePageTecnicoState extends State<DeletePageTecnico> {
  late Future<ResponsavelTecnico> _futureTecnico;

  late String id = "0";
  _DeletePageTecnicoState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureTecnico = fetchTecnico(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Data Example'),
      ),
      body: Center(
        child: FutureBuilder<ResponsavelTecnico>(
          future: _futureTecnico,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${snapshot.data?.nome ?? 'Deleted'}'),
                    ElevatedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          deleteTecnico(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
