import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/DeletePraga.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/GetPraga.dart';
import 'package:updatetest_nulableversion/Model/PragaModel.dart';

class DeletePagePraga extends StatefulWidget {
  final String? idUsuario;

  DeletePagePraga({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePagePragaState createState() => _DeletePagePragaState(idUsuario!);
}

class _DeletePagePragaState extends State<DeletePagePraga> {
  late Future<Praga> _futurePraga;

  late String id = "0";
  _DeletePagePragaState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futurePraga = fetchPraga(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exclsão de Praga'),
      ),
      body: Center(
        child: FutureBuilder<Praga>(
          future: _futurePraga,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${snapshot.data?.nome ?? 'Excluído'}'),
                    ElevatedButton(
                      child: Text('Excluir Praga'),
                      onPressed: () {
                        setState(() {
                          deletePraga(snapshot.data!.id.toString());
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
