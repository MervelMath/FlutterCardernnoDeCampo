import 'dart:convert';

import 'package:updatetest_nulableversion/Model/ProdutorModel.dart';
import 'package:updatetest_nulableversion/Model/TecnicoModel.dart';

Pomar pomarFromJson(String str) => Pomar.fromJson(json.decode(str));

String pomarToJson(Pomar data) => json.encode(data.toJson());

class Pomar {
  Pomar({
    this.id,
    this.nome,
    this.logradouro,
    this.bairroLocalidade,
    this.cidade,
    this.estado,
    this.cep,
    this.produtor,
    this.respTecnico,
  });

  int? id;
  String? nome;
  String? logradouro;
  String? bairroLocalidade;
  String? cidade;
  String? estado;
  String? cep;
  Produtor? produtor;
  ResponsavelTecnico? respTecnico;

  factory Pomar.fromJson(Map<String, dynamic> json) => Pomar(
        id: json["id"],
        nome: json["nome"],
        logradouro: json["logradouro"],
        bairroLocalidade: json["bairro_localidade"],
        cidade: json["cidade"],
        estado: json["estado"],
        cep: json["cep"],
        produtor: Produtor.fromJson(json["produtor"]),
        respTecnico: ResponsavelTecnico.fromJson(json["respTecnico"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "logradouro": logradouro,
        "bairro_localidade": bairroLocalidade,
        "cidade": cidade,
        "estado": estado,
        "cep": cep,
        "produtor": produtor?.toJson(),
        "respTecnico": respTecnico?.toJson(),
      };

  String toString() {
    return nome!;
  }

  @override
  bool equals(Pomar? e1, Pomar? e2) => e1 == e2;
}
