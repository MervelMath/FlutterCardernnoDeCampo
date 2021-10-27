import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/UpdatePomar.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
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
                // produtorController.text = snapshot.data!.produtor!.nome;
                //  respTecnicoController.text = snapshot.data!.respTecnico!.nome;
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
                    CampoDeTextoAddPage("Produtor", produtorController, 10,
                        snapshot.data!.nome.toString()),
                    CampoDeTextoAddPage(
                        "Responsável Técnico",
                        respTecnicoController,
                        10,
                        snapshot.data!.nome.toString()),
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
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          fetchProdutor("25").then((result) {
                            produtor = result;
                          });
                          fetchTecnico("3").then((result) {
                            respTecnico = result;
                          });
                          _futurePomar = updatePomar(
                              snapshot.data!.id.toString(),
                              nomeController.text,
                              logradouroController.text,
                              bairroLocalidadeController.text,
                              cidadeController.text,
                              estadoController.text,
                              cepController.text,
                              produtor,
                              respTecnico);
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
