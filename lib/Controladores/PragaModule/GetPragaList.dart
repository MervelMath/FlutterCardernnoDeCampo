import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PragaModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Future<List<Praga>> fetchPragaList() async {
  final response = await http.get(
    Uri.parse('https://caderno-campo.herokuapp.com/praga'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Praga.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Praga');
  }
}
