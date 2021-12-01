import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/DeletePomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/DeleteQuadra.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/GetQuadra.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

class DeletePageQuadra extends StatefulWidget {
  final String? idQuadra;

  DeletePageQuadra({Key? key, this.idQuadra}) : super(key: key);
  @override
  _DeletePageQuadraState createState() => _DeletePageQuadraState(idQuadra!);
}

class _DeletePageQuadraState extends State<DeletePageQuadra> {
  late Future<Quadra> _futureQuadra;
  late String id = "0";
  _DeletePageQuadraState(String idQuadra) {
    id = idQuadra;
  }

  @override
  void initState() {
    super.initState();
    _futureQuadra = fetchQuadra(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Pomar'),
      ),
      body: Center(
        child: FutureBuilder<Quadra>(
          future: _futureQuadra,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${"Quadra Removida"}'),
                    ElevatedButton(
                      child: Text('Exclusão de Quadra'),
                      onPressed: () {
                        setState(() {
                          deleteQuadra(snapshot.data!.id.toString());
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
