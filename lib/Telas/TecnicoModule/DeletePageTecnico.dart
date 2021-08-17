import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/DeleteProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

class DeletePageTecnico extends StatefulWidget {
  @override
  _DeletePageTecnicoState createState() => _DeletePageTecnicoState();
}

class _DeletePageTecnicoState extends State<DeletePageTecnico> {
  late Future<ResponsavelTecnico> _futureTecnico;

  @override
  void initState() {
    super.initState();
    _futureTecnico = fetchTecnico();
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
                          deleteProdutor(
                              snapshot.data!.idRespTecnico.toString());
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
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
