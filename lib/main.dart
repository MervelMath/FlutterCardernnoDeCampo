import 'package:flutter/material.dart';
import 'package:updatetest_nulableversion/Telas/AddProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/DeleteProdutorPage.dart';
import 'package:updatetest_nulableversion/Telas/UpdatePage.dart';

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
        "/AddPage": (context) => AddPage(),
        "/UpdatePage": (context) => UpdatePage(),
        "/DeletePage": (context) => DeletePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Adicionar Produtor'),
              onPressed: () {
                Navigator.of(context).pushNamed("/AddPage");
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Modificar Produtor'),
              onPressed: () {
                Navigator.of(context).pushNamed("/UpdatePage");
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Remover um Produtor'),
              onPressed: () {
                Navigator.of(context).pushNamed("/DeletePage");
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
