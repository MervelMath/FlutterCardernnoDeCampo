import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/DeleteProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  late Future<Produtor> _futureProdutor;

  @override
  void initState() {
    super.initState();
    _futureProdutor = fetchProdutor();
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
