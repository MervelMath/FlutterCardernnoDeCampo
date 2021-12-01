import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/DeleteCultivar.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/GetCultivar.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/DeleteCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/GetCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';

class DeletePageCultivarQuadra extends StatefulWidget {
  final String? idUsuario;

  DeletePageCultivarQuadra({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePageCultivarQuadraState createState() =>
      _DeletePageCultivarQuadraState(idUsuario!);
}

class _DeletePageCultivarQuadraState extends State<DeletePageCultivarQuadra> {
  late Future<CultivarQuadra> _futureCultivarQuadra;
  late String id = "0";
  _DeletePageCultivarQuadraState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureCultivarQuadra = fetchCultivarQuadra(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exclusão de Porta Enxerto'),
      ),
      body: Center(
        child: FutureBuilder<CultivarQuadra>(
          future: _futureCultivarQuadra,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${"Cultivar da quadra excluída."}'),
                    ElevatedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          deleteCultivarQuadra(snapshot.data!.id.toString());
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
