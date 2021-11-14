import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PortaEnxerto.dart';
import 'dart:async';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

Future<PortaEnxerto> updatePortaEnxerto(String id, String nome) async {
  final response = await http.put(
    Uri.parse('https://caderno-campo.herokuapp.com/portaEnxerto/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{"nome": nome},
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PortaEnxerto.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
