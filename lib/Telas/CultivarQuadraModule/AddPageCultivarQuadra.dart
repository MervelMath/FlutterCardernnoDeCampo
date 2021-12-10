import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarQuadraModel/AddCultivarQuadra.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxertoModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class AddPageCultivarQuadra extends StatefulWidget {
  final Cultivar? idCultivar;
  final Quadra? idQuadra;
  final PortaEnxerto? idPortaEnxerto;

  AddPageCultivarQuadra(
      {Key? key, this.idCultivar, this.idQuadra, this.idPortaEnxerto})
      : super(key: key);
  @override
  _AddPageCultivarQuadraState createState() =>
      _AddPageCultivarQuadraState(idCultivar!, idQuadra!, idPortaEnxerto!);
}

class _AddPageCultivarQuadraState extends State<AddPageCultivarQuadra> {
  Cultivar idCultivar = new Cultivar();
  Quadra idQuadra = new Quadra();
  PortaEnxerto idPortaEnxerto = new PortaEnxerto();

  _AddPageCultivarQuadraState(
      Cultivar idCultivar, Quadra idQuadra, PortaEnxerto idPortaEnxerto) {
    this.idCultivar = idCultivar;
    this.idQuadra = idQuadra;
    this.idPortaEnxerto = idPortaEnxerto;
  }
  final TextEditingController cultivarController = TextEditingController();
  final TextEditingController quadraController = TextEditingController();
  final TextEditingController portaEnxertoController = TextEditingController();
  final TextEditingController qtdeController = TextEditingController();
  late DropdownButton<Produtor> a;
  late Cultivar? cultivar;
  late Quadra? quadra;
  late PortaEnxerto? portaEnxerto;

  Future<CultivarQuadra>? _futureCultivarQuadra;

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
          "Cadastro de Cultivar Quadra",
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
            CampoDeTextoAddPage("Quantidade", qtdeController, 11, true),
            SizedBox(
              height: 10,
            ),
            CampoDeTextoAddPage("Quadra", quadraController, 11, false),
            SizedBox(
              height: 10,
            ),
            CampoDeTextoAddPage("Cultivar", cultivarController, 11, false),
            SizedBox(
              height: 10,
            ),
            CampoDeTextoAddPage(
                "Porta Enxerto", portaEnxertoController, 11, false),
            SizedBox(
              height: 22,
            ),
            _futureCultivarQuadra == null ? Container() : Text("Funcionou!!"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _futureCultivarQuadra = criarCultivarQuadra(idQuadra,
                idPortaEnxerto, idCultivar, int.parse(qtdeController.text));
          });
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
