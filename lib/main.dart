import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Telas/PomarModule/ListPomaresPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/AddPageProdutor.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/ProdutorModule/UpdatePage.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/DeletePageTecnico.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/ListTecnicoPage.dart';
import 'package:updatetest_nulableversion/Telas/TecnicoModule/UpdatePageTecnico.dart';
import 'Telas/ProdutorModule/ListProdutoresPage.dart';
import 'Telas/TecnicoModule/AddPageTecnico.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/ProdutorPage": (context) =>
            ListProdutoresPage(), //ProdutorMainPage(),
        "/TecnicoPage": (context) => ListTecnicosPage(), //TecnicoMainPage(),
        "/PomarPage": (context) => ListPomaresPage(),
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Container(
            width: 300,
            height: 300,
            child: Image.asset('Imagens/Maca_Menu.jpeg')),
      ),
      appBar: AppBar(
        title: Text(
          "Caderno de Campo",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.blue[300],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Icon(Icons.account_circle, size: 50),
              accountName: Text("accountName"),
              accountEmail: Text("accountEmail"),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: Icon(Icons.keyboard_arrow_right_outlined, size: 38),
              title: Text(
                'Produtores',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/ProdutorPage");
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: Icon(Icons.keyboard_arrow_right_outlined, size: 38),
              title: Text(
                'Pomares',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/PomarPage");
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: Icon(Icons.keyboard_arrow_right_outlined, size: 38),
              title: Text(
                'Responsáveis Técnicos',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/TecnicoPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
