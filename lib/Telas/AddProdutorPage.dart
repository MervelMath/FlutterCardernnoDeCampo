import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/AddProdutor.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

import '../TextFieldPersonalizado.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController bairroLocalidadeController =
      TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefone1Controller = TextEditingController();
  final TextEditingController telefone2Controller = TextEditingController();
  Future<Produtor>? _futureProdutor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Produtor",
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
            CampoDeTextoAddPage("Nome", nomeController, 10),
            CampoDeTextoAddPage("Email", emailController, 10),
            CampoDeTextoAddPage("Telefone1", telefone1Controller, 11),
            CampoDeTextoAddPage("Telefone2", telefone2Controller, 11),
            Text(
              "Endereço:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            CampoDeTextoAddPage("Logradouro", logradouroController, 10),
            CampoDeTextoAddPage(
                "Bairro/Localidade", bairroLocalidadeController, 10),
            CampoDeTextoAddPage("Estado", estadoController, 10),
            CampoDeTextoAddPage("Cidade", cidadeController, 10),
            CampoDeTextoAddPage("Cep", cepController, 8),
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
            _futureProdutor = criarProdutor(
                nomeController.text,
                logradouroController.text,
                bairroLocalidadeController.text,
                cidadeController.text,
                estadoController.text,
                cepController.text,
                emailController.text,
                telefone1Controller.text,
                telefone2Controller.text);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
