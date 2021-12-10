import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PragaModel.dart';
import 'dart:async';

Future<Praga> criarPraga(
  String nome,
) async {
  final response = await http.post(
    Uri.parse('https://caderno-campo.herokuapp.com/praga'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "nome": nome,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Praga.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
