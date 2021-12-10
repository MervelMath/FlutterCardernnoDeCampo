// To parse this JSON data, do
//
//     final cultivar = cultivarFromJson(jsonString);

import 'dart:convert';

Cultivar cultivarFromJson(String str) => Cultivar.fromJson(json.decode(str));

String cultivarToJson(Cultivar data) => json.encode(data.toJson());

class Cultivar {
  Cultivar({
    this.id,
    this.nome,
  });

  int? id;
  String? nome;

  factory Cultivar.fromJson(Map<String, dynamic> json) => Cultivar(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
