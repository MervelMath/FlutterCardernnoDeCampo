import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:updatetest_nulableversion/Model/PomarModel.dart';
import 'dart:async';
import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Future<Pomar> updatePomar(
  String id,
  String nome,
  String logradouro,
  String bairroLocalidade,
  String cidade,
  String estado,
  String cep,
  Produtor produtor,
  ResponsavelTecnico respTecnico,
) async {
  final response = await http.put(
    Uri.parse('https://caderno-campo.herokuapp.com/pomar/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        "nome": nome,
        "logradouro": logradouro,
        "bairro_localidade": bairroLocalidade,
        "cidade": cidade,
        "estado": estado,
        "cep": cep,
        "produtor": produtor.toJson(),
        "respTecnico": respTecnico.toJson(),
      },
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pomar.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
