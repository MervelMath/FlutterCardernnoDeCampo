import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/AddProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/DeletePageTecnico.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/UpdatePageTecnico.dart';

import 'Telas/ProdutorModule/ProdutorMainPage.dart';
import 'Telas/TecnicoModule/AddPageTecnico.dart';
import 'Telas/TecnicoModule/TecnicoMainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela Adicionar Produtor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/ProdutorPage": (context) => ProdutorMainPage(),
        "/TecnicoPage": (context) => TecnicoMainPage(),
        "/AddPage": (context) => AddPage(),
        "/UpdatePage": (context) => UpdatePage(),
        "/DeletePage": (context) => DeletePage(),
        "/AddPageTecnico": (context) => AddPageTecnico(),
        "/DeletePageTecnico": (context) => DeletePageTecnico(),
        "/UpdatePageTecnico": (context) => UpdatePageTecnico(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Produtores'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/ProdutorPage");
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('Responsáveis Técnicos'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/TecnicoPage");
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Caderno de Campo",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
      ),
    );
  }
}
