import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/AddQuadra.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageQuadra extends StatefulWidget {
  final Pomar? idPomar;
  AddPageQuadra({Key? key, this.idPomar}) : super(key: key);
  @override
  _AddPageQuadraState createState() => _AddPageQuadraState(idPomar!);
}

class _AddPageQuadraState extends State<AddPageQuadra> {
  Pomar idPomar = new Pomar();
  _AddPageQuadraState(Pomar idPomar) {
    this.idPomar = idPomar;
  }
  final TextEditingController anoController = TextEditingController();
  final TextEditingController distanciaFilasController =
      TextEditingController();
  final TextEditingController distanciaPlantasController =
      TextEditingController();
  final TextEditingController qtdeColmeiasController = TextEditingController();
  final TextEditingController pomarController = TextEditingController();
  Future<Quadra>? _futureQuadra;

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
          "Cadastro de Quadra",
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
            CampoDeTextoAddPage("Ano do Plantio", anoController, 10, true),
            CampoDeTextoAddPage(
                "Distância das Filas", distanciaFilasController, 11, true),
            CampoDeTextoAddPage(
                "Distância das Plantas", distanciaPlantasController, 10, true),
            CampoDeTextoAddPage(
                "Quantidade de Colméias", qtdeColmeiasController, 10, true),
            CampoDeTextoAddPage(
                idPomar.nome.toString(), pomarController, 10, false),
            SizedBox(
              height: 22,
            ),
            _futureQuadra == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureQuadra = criarQuadra(
                anoController.text,
                distanciaFilasController.text,
                distanciaPlantasController.text,
                qtdeColmeiasController.text,
                this.idPomar);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
