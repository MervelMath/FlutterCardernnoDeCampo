import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/AddPageProdutor.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';
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
            BotaoElevadoComNavegacao(
              texto: "Adicionar Produtor",
              rota: "/AddPage",
              pagina: AddPage(),
            ),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao(
              texto: "Modificar Produtor",
              rota: "PaginaEntidadeProdutor",
              pagina: UpdatePage(),
            ),
            SizedBox(
              height: 10,
            ),
            BotaoElevadoComNavegacao(
              texto: "Remover um Produtor",
              rota: "PaginaEntidadeProdutor",
              pagina: DeletePage(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
