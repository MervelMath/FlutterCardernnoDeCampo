import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/AddPomar.dart';
import 'package:updatetest_nulableversion/Controladores/ProdutorModule/GetProdutor.dart';
import 'package:updatetest_nulableversion/Controladores/TecnicoModule/GetTecnico.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPagePomar extends StatefulWidget {
  final Produtor? idProdutor;
  final ResponsavelTecnico? idTecnico;
  AddPagePomar({Key? key, this.idProdutor, this.idTecnico}) : super(key: key);
  @override
  _AddPagePomarState createState() =>
      _AddPagePomarState(idProdutor!, idTecnico!);
}

class _AddPagePomarState extends State<AddPagePomar> {
  Produtor idProdutor = new Produtor();
  ResponsavelTecnico idTecnico = new ResponsavelTecnico();
  _AddPagePomarState(Produtor idProdutor, ResponsavelTecnico idTecnico) {
    this.idProdutor = idProdutor;
    this.idTecnico = idTecnico;
  }
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController bairroLocalidadeController =
      TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController produtorController = TextEditingController();
  final TextEditingController respTecnicoController = TextEditingController();
  late DropdownButton<Produtor> a;
  late Produtor? produtor;
  late ResponsavelTecnico? respTecnico;
  Future<Pomar>? _futurePomar;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Cadastro de Pomar",
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
            CampoDeTextoAddPage("Nome", nomeController, 10, ""),
            CampoDeTextoAddPage(
                "Resposável Técnico", respTecnicoController, 11, ""),
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
            CampoDeTextoAddPage("Logradouro", logradouroController, 10, ""),
            CampoDeTextoAddPage(
                "Bairro/Localidade", bairroLocalidadeController, 10, ""),
            CampoDeTextoAddPage("Estado", estadoController, 10, ""),
            CampoDeTextoAddPage("Cidade", cidadeController, 10, ""),
            CampoDeTextoAddPage("Cep", cepController, 8, ""),
            SizedBox(
              height: 22,
            ),
            _futurePomar == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futurePomar = criarPomar(
                nomeController.text,
                logradouroController.text,
                bairroLocalidadeController.text,
                cidadeController.text,
                estadoController.text,
                cepController.text,
                idProdutor,
                this.idTecnico);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
