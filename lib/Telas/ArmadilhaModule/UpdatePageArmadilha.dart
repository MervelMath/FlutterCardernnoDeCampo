import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/GetArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/ArmadilhaModule/UpdateArmadilha.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/GetPomar.dart';
import 'package:updatetest_nulableversion/Controladores/PomarModule/UpdatePomar.dart';
import 'package:updatetest_nulableversion/Model/Armadilha.dart';
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageArmadilha extends StatefulWidget {
  final String? id; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePageArmadilha({Key? key, this.id}) : super(key: key);
  void verifica() {}

  @override
  _UpdatePageArmadilhaState createState() => _UpdatePageArmadilhaState(id!);
}

class _UpdatePageArmadilhaState extends State<UpdatePageArmadilha> {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController localizacaoTexto = TextEditingController();
  final TextEditingController quadraController = TextEditingController();
  late Future<Armadilha> _futureArmadilha;
  late Produtor produtor;
  late ResponsavelTecnico respTecnico;

  late String id = "0";
  _UpdatePageArmadilhaState(String id) {
    this.id = id;
  }

  @override
  void initState() {
    super.initState();
    _futureArmadilha = fetchArmadilha(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Armadilha'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Armadilha>(
          future: _futureArmadilha,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                latitudeController.text = snapshot.data!.latitude.toString();
                longitudeController.text = snapshot.data!.longitude.toString();
                localizacaoTexto.text = snapshot.data!.localizacaoTexto!;
                quadraController.text = snapshot.data!.quadra!.id.toString();
                return ListView(
                  children: <Widget>[
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
                        "Latitude", latitudeController, 20, true),
                    CampoDeTextoAddPage(
                        "Longitude", longitudeController, 20, true),
                    CampoDeTextoAddPage(
                        "Localização do Texto", localizacaoTexto, 20, true),
                    CampoDeTextoAddPage("Quadra", quadraController, 20, false),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureArmadilha = updateArmadilha(
                              snapshot.data!.id.toString(),
                              double.parse(latitudeController.text),
                              double.parse(longitudeController.text),
                              localizacaoTexto.text,
                              snapshot.data!.quadra!);
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
