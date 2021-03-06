import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';

Future<Produtor> fetchProdutor(String id) async {
  final response = await http.get(
    Uri.parse('https://caderno-campo.herokuapp.com/produtor/' + id),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Produtor.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Produtor');
  }
}
