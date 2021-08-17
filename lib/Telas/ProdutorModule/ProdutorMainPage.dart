import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/WidgetsPersonalizados/BotaoElevadoComNavegacao.dart';

class ProdutorMainPage extends StatefulWidget {
  @override
  _ProdutorMainPageState createState() => _ProdutorMainPageState();
}

class _ProdutorMainPageState extends State<ProdutorMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Produtores",
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
            BotaoElevadoComNavegacao("Adicionar Produtor", "/AddPage"),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao("Modificar Produtor", "/UpdatePage"),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao("Remover um Produtor", "/DeletePage"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
