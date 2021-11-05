import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/UpdateProdutor.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePage extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePage({Key? key, this.idUsuario}) : super(key: key);
  void verifica() {}

  @override
  _UpdatePageState createState() => _UpdatePageState(idUsuario!);
}

class _UpdatePageState extends State<UpdatePage> {
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
  late Future<Produtor> _futureProdutor;

  late String id = "0";
  _UpdatePageState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureProdutor = fetchProdutor(id);
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
        child: FutureBuilder<Produtor>(
          future: _futureProdutor,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                nomeController.text = snapshot.data!.nome!;
                logradouroController.text = snapshot.data!.logradouro!;
                bairroLocalidadeController.text =
                    snapshot.data!.bairroLocalidade!;
                cidadeController.text = snapshot.data!.cidade!;
                estadoController.text = snapshot.data!.estado!;
                cepController.text = snapshot.data!.cep!;
                emailController.text = snapshot.data!.email!;
                telefone1Controller.text = snapshot.data!.telefone1!;
                telefone2Controller.text = snapshot.data!.telefone2!;
                return ListView(
                  children: <Widget>[
                    Text(snapshot.data!.nome!),
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
                    CampoDeTextoAddPage(
                        "Logradouro", logradouroController, 10, true),
                    CampoDeTextoAddPage("Bairro/Localidade",
                        bairroLocalidadeController, 10, true),
                    CampoDeTextoAddPage("Estado", estadoController, 10, true),
                    CampoDeTextoAddPage("Cidade", cidadeController, 10, true),
                    CampoDeTextoAddPage("Cep", cepController, 8, true),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureProdutor = updateProdutor(
                              snapshot.data!.id.toString(),
                              nomeController.text,
                              logradouroController.text,
                              bairroLocalidadeController.text,
                              cidadeController.text,
                              estadoController.text,
                              cepController.text,
                              emailController.text,
                              snapshot.data!.telefone1!,
                              snapshot.data!.telefone2!);
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
