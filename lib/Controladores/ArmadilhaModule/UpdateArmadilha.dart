import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/Armadilha.dart';
import 'dart:async';
import 'package:updatetest_nulableversion/Model/QuadraModel.dart';

Future<Armadilha> updateArmadilha(
  String id,
  double latitude,
  double longitude,
  String localizacaoTexto,
  Quadra quadra,
) async {
  final response = await http.put(
    Uri.parse('https://caderno-campo.herokuapp.com/armadilha/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        "latitude": latitude,
        "longitude": longitude,
        "localizacaoTexto": localizacaoTexto,
        "quadra": quadra.toJson()
      },
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Armadilha.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
