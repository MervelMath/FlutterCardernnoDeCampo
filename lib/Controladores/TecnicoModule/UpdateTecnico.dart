import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Future<ResponsavelTecnico> updateTecnico(
    String id,
    String nome,
    String logradouro,
    String bairroLocalidade,
    String cidade,
    String estado,
    String cep,
    String email,
    String telefone1,
    String telefone2,
    String crea) async {
  final response = await http.patch(
    Uri.parse(
        'https://caderno-de-campo-nestjs.herokuapp.com/respTecnico/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "nome": nome,
        "logradouro": logradouro,
        "bairro_localidade": bairroLocalidade,
        "cidade": cidade,
        "estado": estado,
        "cep": cep,
        "email": email,
        "telefone1": telefone1,
        "telefone2": telefone2,
        "crea": crea
      },
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ResponsavelTecnico.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
