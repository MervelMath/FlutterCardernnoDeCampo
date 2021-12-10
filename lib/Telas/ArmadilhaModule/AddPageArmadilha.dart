import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/AddArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/AddPomar.dart';
import 'package:updatetest_nulableversion/Model/Armadilha.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageArmadilha extends StatefulWidget {
  final Quadra? idQuadra;
  AddPageArmadilha({Key? key, this.idQuadra}) : super(key: key);
  @override
  _AddPageArmadilhaState createState() => _AddPageArmadilhaState(idQuadra!);
}

class _AddPageArmadilhaState extends State<AddPageArmadilha> {
  Quadra idQuadra = new Quadra();
  _AddPageArmadilhaState(Quadra idQuadra) {
    this.idQuadra = idQuadra;
  }
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController localizacaoTexto = TextEditingController();
  final TextEditingController quadraController = TextEditingController();
  late DropdownButton<Quadra> a;
  Future<Armadilha>? _futureArmadilha;

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
          "Cadastro de Armadilha",
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
            CampoDeTextoAddPage("Latitude", latitudeController, 10, true),
            CampoDeTextoAddPage("Longitude", longitudeController, 11, true),
            CampoDeTextoAddPage(
                "Localização do Texto", localizacaoTexto, 10, true),
            SizedBox(
              height: 22,
            ),
            _futureArmadilha == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureArmadilha = criarArmadilha(
                double.parse(latitudeController.text),
                double.parse(longitudeController.text),
                localizacaoTexto.text,
                idQuadra);
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
