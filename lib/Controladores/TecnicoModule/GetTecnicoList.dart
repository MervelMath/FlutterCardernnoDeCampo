import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Future<List<ResponsavelTecnico>> fetchTecnicoList() async {
  final response = await http.get(
    Uri.parse('https://caderno-de-campo-nestjs.herokuapp.com/respTecnico'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new ResponsavelTecnico.fromJson(data))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Produtor');
  }
}
