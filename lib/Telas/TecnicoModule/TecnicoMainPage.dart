import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/WidgetsPersonalizados/BotaoElevadoComNavegacao.dart';

class TecnicoMainPage extends StatefulWidget {
  @override
  _TecnicoMainPageState createState() => _TecnicoMainPageState();
}

class _TecnicoMainPageState extends State<TecnicoMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsáveis Técnicos",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoElevadoComNavegacao("Adicionar Tecnico", "/AddPageTecnico"),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao("Remover Tecnico", "/DeletePageTecnico"),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao("Modificar Tecnico", "/UpdatePageTecnico"),
          ],
        ),
      ),
    );
  }
}
