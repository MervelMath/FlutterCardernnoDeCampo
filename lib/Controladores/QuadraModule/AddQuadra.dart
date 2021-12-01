import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'dart:async';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

Future<Quadra> criarQuadra(
  String anoPlantio,
  String distanciaFilas,
  String distanciaPlantas,
  String quantidadeColmeias,
  Pomar pomar,
) async {
  final response = await http.post(
    Uri.parse('https://caderno-campo.herokuapp.com/quadra'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "anoPlantio": anoPlantio,
      "distanciaFilas": distanciaFilas,
      "distanciaPlantas": distanciaPlantas,
      "quantidadeColmeias": quantidadeColmeias,
      "pomar": pomar.toJson(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Quadra.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
