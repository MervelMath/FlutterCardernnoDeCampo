import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/AddCultivar.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageCultivar extends StatefulWidget {
  @override
  _AddPageAddPageCultivarState createState() => _AddPageAddPageCultivarState();
}

class _AddPageAddPageCultivarState extends State<AddPageCultivar> {
  final TextEditingController nomeController = TextEditingController();
  Future<Cultivar>? _futureCultivar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Cultivar",
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
            _futureCultivar == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureCultivar = criarCultivar(nomeController.text);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
