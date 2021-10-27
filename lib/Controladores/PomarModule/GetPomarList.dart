import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PomarModel.dart';

Future<List<Pomar>> fetchPomarList(String? id) async {
  final response = (id != "0")
      ? await http.get(
          Uri.parse(
              'https://caderno-campo.herokuapp.com/pomar?produtor=' + id!),
        )
      : await http.get(Uri.parse('https://caderno-campo.herokuapp.com/pomar'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);

    return jsonResponse.map((data) => new Pomar.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Produtor');
  }
}
