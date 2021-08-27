import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/DeleteProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

class DeletePage extends StatefulWidget {
  final String? idUsuario;

  DeletePage({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePageState createState() => _DeletePageState(idUsuario!);
}

class _DeletePageState extends State<DeletePage> {
  late Future<Produtor> _futureProdutor;
  late String id = "0";
  _DeletePageState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureProdutor = fetchProdutor(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Produtor>(
          future: _futureProdutor,
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
                          deleteProdutor(snapshot.data!.idProdutor.toString());
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
