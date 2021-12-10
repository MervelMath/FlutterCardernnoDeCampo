import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/CultivarModel.dart';
import 'package:updatetest_nulableversion/Model/CultivarQuadraModel.dart';
import 'package:updatetest_nulableversion/Model/PortaEnxertoModel.dart';
import 'dart:async';

import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

Future<CultivarQuadra> criarCultivarQuadra(Quadra quadra, PortaEnxerto enxerto,
    Cultivar cultivar, int quantidade) async {
  final response = await http.post(
    Uri.parse('https://caderno-campo.herokuapp.com/cultivarQuadra'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "enxerto": enxerto.toJson(),
      "quadra": quadra.toJson(),
      "cultivar": cultivar.toJson(),
      "quantidade": quantidade,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return CultivarQuadra.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
