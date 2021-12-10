import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/GetPraga.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/UpdatePraga.dart';
import 'package:updatetest_nulableversion/Model/PragaModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePagePraga extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePagePraga({Key? key, this.idUsuario}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState(idUsuario!);
}

class _UpdatePageState extends State<UpdatePagePraga> {
  final TextEditingController nomeController = TextEditingController();
  Future<Praga>? _futurePraga;

  late String id = "0";
  _UpdatePageState(String idUsuario) {
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
        title: Text('Update Data Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Praga>(
          future: _futurePraga,
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
                          _futurePraga = updatePraga(
                            snapshot.data!.id.toString(),
                            nomeController.text,
                          );
                        });
                      },
                      child: Text('Atualizar Praga'),
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
