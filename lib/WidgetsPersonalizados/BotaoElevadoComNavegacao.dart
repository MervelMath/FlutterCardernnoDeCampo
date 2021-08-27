import 'package:flutter/material.dart';

class BotaoElevadoComNavegacao extends StatelessWidget {
  final String texto;
  final String rota;
  final StatefulWidget?
      pagina; //preciso rever a necessidade desse parâmetro ser opcional.

  BotaoElevadoComNavegacao(
      {Key? key, required this.texto, required this.rota, this.pagina})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(texto),
      onPressed: () {
        {}
      },
      style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
    );
  }
}
