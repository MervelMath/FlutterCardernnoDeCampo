import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/DeleteCultivar.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/GetCultivar.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';

class DeletePageCultivar extends StatefulWidget {
  final String? idUsuario;

  DeletePageCultivar({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePageCultivarState createState() =>
      _DeletePageCultivarState(idUsuario!);
}

class _DeletePageCultivarState extends State<DeletePageCultivar> {
  late Future<Cultivar> _futureCultivar;
  late String id = "0";
  _DeletePageCultivarState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureCultivar = fetchCultivar(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exclusão de Porta Enxerto'),
      ),
      body: Center(
        child: FutureBuilder<Cultivar>(
          future: _futureCultivar,
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
                          deleteCultivar(snapshot.data!.id.toString());
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
