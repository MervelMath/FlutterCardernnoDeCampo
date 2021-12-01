import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/AddCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageCultivarQuadra extends StatefulWidget {
  @override
  _AddPageCultivarQuadraState createState() => _AddPageCultivarQuadraState();
}

class _AddPageCultivarQuadraState extends State<AddPageCultivarQuadra> {
  final TextEditingController nomeController = TextEditingController();
  Future<CultivarQuadra>? _futureCultivarQuadra;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Cultivar Quadra",
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
            _futureCultivarQuadra == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureCultivarQuadra = criarCultivarQuadra(nomeController.text);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
