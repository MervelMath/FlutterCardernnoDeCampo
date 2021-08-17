import 'package:flutter/material.dart';

class BotaoElevadoComNavegacao extends StatelessWidget {
  final String texto;
  final String rota;
  const BotaoElevadoComNavegacao(this.texto, this.rota);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(texto),
      onPressed: () {
        Navigator.of(context).pushNamed(rota);
      },
      style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
    );
  }
}
