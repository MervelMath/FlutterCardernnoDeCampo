import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/DeleteArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/GetArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/DeletePomar.dart';
import 'package:updatetest_nulableversion/Model/Armadilha.dart';

class DeletePageArmadilha extends StatefulWidget {
  final String? idArmadilha;

  DeletePageArmadilha({Key? key, this.idArmadilha}) : super(key: key);
  @override
  _DeletePageArmadilhaState createState() =>
      _DeletePageArmadilhaState(idArmadilha!);
}

class _DeletePageArmadilhaState extends State<DeletePageArmadilha> {
  late Future<Armadilha> _futureArmadilha;
  late String id = "0";
  _DeletePageArmadilhaState(String idArmadilha) {
    id = idArmadilha;
  }

  @override
  void initState() {
    super.initState();
    _futureArmadilha = fetchArmadilha(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Pomar'),
      ),
      body: Center(
        child: FutureBuilder<Armadilha>(
          future: _futureArmadilha,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${snapshot.data?.quadra?.pomar?.nome ?? 'Deleted'}'),
                    ElevatedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          deleteArmadilha(snapshot.data!.id.toString());
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
