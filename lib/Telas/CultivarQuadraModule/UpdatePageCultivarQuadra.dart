import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/GetPortaEnxerto.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/UpdatePortaEnxerto.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/UpdateProdutor.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxertoModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePagePortaEnxerto extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePagePortaEnxerto({Key? key, this.idUsuario}) : super(key: key);

  @override
  _UpdatePagePortaEnxertoState createState() =>
      _UpdatePagePortaEnxertoState(idUsuario!);
}

class _UpdatePagePortaEnxertoState extends State<UpdatePagePortaEnxerto> {
  final TextEditingController nomeController = TextEditingController();
  late Future<PortaEnxerto> _futurePortaEnxerto;

  late String id = "0";
  _UpdatePagePortaEnxertoState(String idUsuario) {
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
        title: Text('Atualizar Porta Enxerto'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<PortaEnxerto>(
          future: _futurePortaEnxerto,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                nomeController.text = snapshot.data!.nome;
                return ListView(
                  children: <Widget>[
                    Text(snapshot.data!.nome),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Informações básicas:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CampoDeTextoAddPage("Nome", nomeController, 10, true),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futurePortaEnxerto = updatePortaEnxerto(
                              snapshot.data!.id.toString(),
                              nomeController.text);
                        });
                      },
                      child: Text('Atualizar Porta Enxerto'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
