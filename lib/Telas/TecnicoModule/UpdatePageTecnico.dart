import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/UpdateTecnico.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageTecnico extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePageTecnico> {
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
  void initState() {
    super.initState();
    _futureRespTecnico = fetchTecnico();
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
        child: FutureBuilder<ResponsavelTecnico>(
          future: _futureRespTecnico,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
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
                    CampoDeTextoAddPage("Crea", creaController, 8),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureRespTecnico = updateTecnico(
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
                      child: Text('Update Data'),
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
