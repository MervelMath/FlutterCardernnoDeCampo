import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PortaEnxertoModule/AddPortaEnxerto.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/AddProdutor.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxerto.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPagePortaEnxerto extends StatefulWidget {
  @override
  _AddPagePortaEnxertoState createState() => _AddPagePortaEnxertoState();
}

class _AddPagePortaEnxertoState extends State<AddPagePortaEnxerto> {
  final TextEditingController nomeController = TextEditingController();
  Future<PortaEnxerto>? _futureProdutor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Porta Enxerto",
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
            _futureProdutor == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureProdutor = criarPortaEnxerto(nomeController.text);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
