import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/GetCultivar.dart';
import 'package:updatetest_nulableversion/Controladores/CultivarModule/UpdateCultivar.dart';
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import '../../WidgetsPersonalizados/TextFieldPersonalizado.dart';

class UpdatePageCultivar extends StatefulWidget {
  final String?
      idUsuario; //preciso rever a necessidade desse parâmetro ser opcional.

  UpdatePageCultivar({Key? key, this.idUsuario}) : super(key: key);

  @override
  _UpdatePageCultivarState createState() =>
      _UpdatePageCultivarState(idUsuario!);
}

class _UpdatePageCultivarState extends State<UpdatePageCultivar> {
  final TextEditingController nomeController = TextEditingController();
  late Future<Cultivar> _futureCultivar;

  late String id = "0";
  _UpdatePageCultivarState(String idUsuario) {
    id = idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _futureCultivar = fetchCultivar(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualizar Porta Enxerto'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Cultivar>(
          future: _futureCultivar,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                nomeController.text = snapshot.data!.nome!;
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
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureCultivar = updateCultivar(
                              snapshot.data!.id.toString(),
                              nomeController.text);
                        });
                      },
                      child: Text('Atualizar Cultivar'),
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
