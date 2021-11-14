import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/DeletePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/GetPortaEnxerto.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/DeleteProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxerto.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

class DeletePagePortaEnxerto extends StatefulWidget {
  final String? idUsuario;

  DeletePagePortaEnxerto({Key? key, this.idUsuario}) : super(key: key);
  @override
  _DeletePagePortaEnxertoState createState() =>
      _DeletePagePortaEnxertoState(idUsuario!);
}

class _DeletePagePortaEnxertoState extends State<DeletePagePortaEnxerto> {
  late Future<PortaEnxerto> _futurePortaEnxerto;
  late String id = "0";
  _DeletePagePortaEnxertoState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futurePortaEnxerto = fetchPortaEnxerto(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluisão de Porta Enxerto'),
      ),
      body: Center(
        child: FutureBuilder<PortaEnxerto>(
          future: _futurePortaEnxerto,
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
                          deletePortaEnxerto(snapshot.data!.id.toString());
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
