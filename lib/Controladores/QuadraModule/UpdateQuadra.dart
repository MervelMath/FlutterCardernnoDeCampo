import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'dart:async';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

Future<Quadra> updateQuadra(
  String id,
  int anoPlantio,
  int distanciaFilas,
  int distanciaPlantas,
  int quantidadeColmeias,
  Pomar pomar,
) async {
  final response = await http.put(
    Uri.parse('https://caderno-campo.herokuapp.com/quadra/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        "anoPlantio": anoPlantio,
        "distanciaFilas": distanciaFilas,
        "distanciaPlantas": distanciaPlantas,
        "quantidadeColmeias": quantidadeColmeias,
        "id_pomar": pomar.toJson(),
      },
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quadra.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
