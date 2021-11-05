import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/AddTecnico.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageTecnico extends StatefulWidget {
  @override
  _AddPageTecnicoState createState() => _AddPageTecnicoState();
}

class _AddPageTecnicoState extends State<AddPageTecnico> {
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
  final TextEditingController creaController = TextEditingController();
  Future<ResponsavelTecnico>? _futureRespTecnico;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Responsável Técnico",
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
            CampoDeTextoAddPage("Email", emailController, 10, true),
            CampoDeTextoAddPage("Telefone1", telefone1Controller, 11, true),
            CampoDeTextoAddPage("Telefone2", telefone2Controller, 11, true),
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
            CampoDeTextoAddPage("Logradouro", logradouroController, 10, true),
            CampoDeTextoAddPage(
                "Bairro/Localidade", bairroLocalidadeController, 10, true),
            CampoDeTextoAddPage("Estado", estadoController, 10, true),
            CampoDeTextoAddPage("Cidade", cidadeController, 10, true),
            CampoDeTextoAddPage("Cep", cepController, 8, true),
            CampoDeTextoAddPage("Crea", creaController, 8, true),
            SizedBox(
              height: 22,
            ),
            _futureRespTecnico == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureRespTecnico = criarRespTecnico(
                nomeController.text,
                logradouroController.text,
                bairroLocalidadeController.text,
                cidadeController.text,
                estadoController.text,
                cepController.text,
                emailController.text,
                telefone1Controller.text,
                telefone2Controller.text,
                creaController.text);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
