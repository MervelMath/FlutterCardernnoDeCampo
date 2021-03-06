import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/GetCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/UpdateCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageCultivarQuadra extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePageCultivarQuadra({Key? key, this.idUsuario}) : super(key: key);

  @override
  _UpdatePageCultivarQuadraState createState() =>
      _UpdatePageCultivarQuadraState(idUsuario!);
}

class _UpdatePageCultivarQuadraState extends State<UpdatePageCultivarQuadra> {
  final TextEditingController nomeController = TextEditingController();
  late Future<CultivarQuadra> _futureCultivarQuadra;

  late String id = "0";
  _UpdatePageCultivarQuadraState(String idUsuario) {
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
        title: Text('Atualizar Porta Enxerto'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<CultivarQuadra>(
          future: _futureCultivarQuadra,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                nomeController.text = snapshot.data!.cultivar.nome!;
                return ListView(
                  children: <Widget>[
                    Text(snapshot.data!.cultivar.nome!),
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
                          _futureCultivarQuadra = updateCultivarQuadra(
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
