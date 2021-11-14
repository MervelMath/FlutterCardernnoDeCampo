import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/UpdatePomar.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePagePomar extends StatefulWidget {
  final String? id; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePagePomar({Key? key, this.id}) : super(key: key);
  void verifica() {}

  @override
  _UpdatePagePomarState createState() => _UpdatePagePomarState(id!);
}

class _UpdatePagePomarState extends State<UpdatePagePomar> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController bairroLocalidadeController =
      TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController produtorController = TextEditingController();
  final TextEditingController respTecnicoController = TextEditingController();
  late Future<Pomar> _futurePomar;
  late Produtor produtor;
  late ResponsavelTecnico respTecnico;

  late String id = "0";
  _UpdatePagePomarState(String id) {
    this.id = id;
  }

  @override
  void initState() {
    super.initState();
    _futurePomar = fetchPomar(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Pomar'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Pomar>(
          future: _futurePomar,
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
                produtorController.text =
                    snapshot.data!.produtor.nome.toString();
                respTecnicoController.text =
                    snapshot.data!.respTecnico.nome.toString();
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
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CampoDeTextoAddPage("Nome", nomeController, 20, true),
                    CampoDeTextoAddPage(
                        "Produtor", produtorController, 20, false),
                    CampoDeTextoAddPage("Responsável Técnico",
                        respTecnicoController, 20, false),
                    Text(
                      "Endereço:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CampoDeTextoAddPage(
                        "Logradouro", logradouroController, 20, true),
                    CampoDeTextoAddPage("Bairro/Localidade",
                        bairroLocalidadeController, 20, true),
                    CampoDeTextoAddPage("Estado", estadoController, 20, true),
                    CampoDeTextoAddPage("Cidade", cidadeController, 20, true),
                    CampoDeTextoAddPage("Cep", cepController, 8, true),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futurePomar = updatePomar(
                              snapshot.data!.id.toString(),
                              nomeController.text,
                              logradouroController.text,
                              bairroLocalidadeController.text,
                              cidadeController.text,
                              estadoController.text,
                              cepController.text,
                              snapshot.data!.produtor,
                              snapshot.data!.respTecnico);
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
