import 'dart:async';
import 'package:http/http.dart' as http;

Future<http.Response> deleteTecnico(String idTecnico) async {
  final http.Response response = await http.delete(
    Uri.parse(
        'https://caderno-de-campo-nestjs.herokuapp.com/respTecnico/$idTecnico'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return response;
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}
