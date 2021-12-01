import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomarList.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/UpdatePomar.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/GetQuadra.dart';
import 'package:updatetest_nulableversion/Controladores/QuadraModule/UpdateQuadra.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageQuadra extends StatefulWidget {
  final String? id; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePageQuadra({Key? key, this.id}) : super(key: key);
  void verifica() {}

  @override
  _UpdatePageQuadraState createState() => _UpdatePageQuadraState(id!);
}

class _UpdatePageQuadraState extends State<UpdatePageQuadra> {
  final TextEditingController anoController = TextEditingController();
  final TextEditingController distanciaFilasController =
      TextEditingController();
  final TextEditingController distanciaPlantasController =
      TextEditingController();
  final TextEditingController qtdeColmeiasController = TextEditingController();
  final TextEditingController pomarController = TextEditingController();
  Future<Quadra>? _futureQuadra;
  Pomar? teste;
  List<Pomar>? pomares = [];
  late String id = "0";

  _UpdatePageQuadraState(String id) {
    this.id = id;
  }

  @override
  void initState() {
    super.initState();
    _futureQuadra = fetchQuadra(id);
    _loadData();
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
        child: FutureBuilder<Quadra>(
          future: _futureQuadra,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                anoController.text = snapshot.data!.anoPlantio.toString();
                distanciaFilasController.text =
                    snapshot.data!.distanciaFilas.toString();
                qtdeColmeiasController.text =
                    snapshot.data!.quantidadeColmeias.toString();
                distanciaPlantasController.text =
                    snapshot.data!.distanciaPlantas.toString();
                pomarController.text = snapshot.data!.pomar.nome!;
                return ListView(
                  children: <Widget>[
                    Text(snapshot.data!.pomar.nome!),
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
                    CampoDeTextoAddPage(
                        "Ano do Plantio", anoController, 20, true),
                    CampoDeTextoAddPage("Distância das Filas",
                        distanciaFilasController, 20, true),
                    CampoDeTextoAddPage("Distância das Plantas",
                        distanciaPlantasController, 20, true),
                    CampoDeTextoAddPage("Quantidade de Colméias",
                        qtdeColmeiasController, 20, true),
                    DropdownButton<Pomar>(
                      value: teste,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 20,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (Pomar? newValue) {
                        setState(() {
                          teste = newValue;
                        });
                      },
                      items:
                          pomares!.map<DropdownMenuItem<Pomar>>((Pomar value) {
                        return DropdownMenuItem<Pomar>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureQuadra = updateQuadra(
                              snapshot.data!.id.toString(),
                              int.parse(anoController.text),
                              int.parse(distanciaFilasController.text),
                              int.parse(distanciaPlantasController.text),
                              int.parse(qtdeColmeiasController.text),
                              teste!);
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

  Future<void> _loadData() async {
    try {
      var result = await fetchPomarList("0");

      setState(() {
        pomares = result;
      });
    } catch (err) {
      throw err;
    }
  }
}
