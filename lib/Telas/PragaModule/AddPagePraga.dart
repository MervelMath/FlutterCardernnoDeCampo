import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PragaModule/AddPraga.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/AddTecnico.dart';
import 'package:updatetest_nulableversion/Model/PragaModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPagePraga extends StatefulWidget {
  @override
  _AddPagePragaState createState() => _AddPagePragaState();
}

class _AddPagePragaState extends State<AddPagePraga> {
  final TextEditingController nomeController = TextEditingController();
  Future<Praga>? _futurePraga;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Praga",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(32),
        child: ListView(
          children: [
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
            _futurePraga == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futurePraga = criarPraga(
              nomeController.text,
            );
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
