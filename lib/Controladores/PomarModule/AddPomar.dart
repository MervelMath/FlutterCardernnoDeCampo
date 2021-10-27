import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'dart:async';

import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Future<Pomar> criarPomar(
    String nome,
    String logradouro,
    String bairroLocalidade,
    String cidade,
    String estado,
    String cep,
    Produtor produtor,
    ResponsavelTecnico respTecnico) async {
  final response = await http.post(
    Uri.parse('https://caderno-campo.herokuapp.com/pomar'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "nome": "pomar-02",
      "logradouro": "pomar-02",
      "bairro_localidade": "pomar-02",
      "cidade": "pomar-02",
      "estado": "pomar-02",
      "cep": "22222222",
      "produtor": produtor,
      "respTecnico": respTecnico,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Pomar.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
