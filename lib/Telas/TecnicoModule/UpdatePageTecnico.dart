import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/UpdateTecnico.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageTecnico extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePageTecnico({Key? key, this.idUsuario}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState(idUsuario!);
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

  late String id = "0";
  _UpdatePageState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureRespTecnico = fetchTecnico(id);
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
                nomeController.text = snapshot.data!.nome;
                logradouroController.text = snapshot.data!.logradouro;
                bairroLocalidadeController.text =
                    snapshot.data!.bairroLocalidade;
                cidadeController.text = snapshot.data!.cidade;
                estadoController.text = snapshot.data!.estado;
                cepController.text = snapshot.data!.cep;
                emailController.text = snapshot.data!.email;
                telefone1Controller.text = snapshot.data!.telefone1;
                telefone2Controller.text = snapshot.data!.telefone2;
                creaController.text = snapshot.data!.crea;
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
                    CampoDeTextoAddPage(
                        "Nome", nomeController, 10, snapshot.data!.nome),
                    CampoDeTextoAddPage(
                        "Email", emailController, 10, snapshot.data!.email),
                    CampoDeTextoAddPage("Telefone1", telefone1Controller, 11,
                        snapshot.data!.telefone1),
                    CampoDeTextoAddPage("Telefone2", telefone2Controller, 11,
                        snapshot.data!.telefone2),
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
                    CampoDeTextoAddPage("Logradouro", logradouroController, 10,
                        snapshot.data!.logradouro),
                    CampoDeTextoAddPage(
                        "Bairro/Localidade",
                        bairroLocalidadeController,
                        10,
                        snapshot.data!.bairroLocalidade),
                    CampoDeTextoAddPage(
                        "Estado", estadoController, 10, snapshot.data!.estado),
                    CampoDeTextoAddPage(
                        "Cidade", cidadeController, 10, snapshot.data!.cidade),
                    CampoDeTextoAddPage(
                        "Cep", cepController, 8, snapshot.data!.cep),
                    CampoDeTextoAddPage(
                        "Crea", creaController, 8, snapshot.data!.crea),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureRespTecnico = updateTecnico(
                              snapshot.data!.id.toString(),
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
