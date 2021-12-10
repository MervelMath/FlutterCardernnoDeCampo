// To parse this JSON data, do
//
//     final quadra = quadraFromJson(jsonString);

import 'dart:convert';

import 'PomarModel.dart';

Quadra quadraFromJson(String str) => Quadra.fromJson(json.decode(str));

String quadraToJson(Quadra data) => json.encode(data.toJson());

class Quadra {
  Quadra({
    this.id,
    this.anoPlantio,
    this.distanciaFilas,
    this.distanciaPlantas,
    this.quantidadeColmeias,
    this.pomar,
  });

  int? id;
  int? anoPlantio;
  int? distanciaFilas;
  int? distanciaPlantas;
  int? quantidadeColmeias;
  Pomar? pomar;

  factory Quadra.fromJsonId(Map<String, dynamic> json) => Quadra(
        id: json["id"],
        anoPlantio: json["anoPlantio"],
        distanciaFilas: json["distanciaFilas"],
        distanciaPlantas: json["distanciaPlantas"],
        quantidadeColmeias: json["quantidadeColmeias"],
        pomar: Pomar.fromJson(json["id_pomar"]),
      );

  factory Quadra.fromJson(Map<String, dynamic> json) => Quadra(
        id: json["id"],
        anoPlantio: json["anoPlantio"],
        distanciaFilas: json["distanciaFilas"],
        distanciaPlantas: json["distanciaPlantas"],
        quantidadeColmeias: json["quantidadeColmeias"],
        pomar: Pomar.fromJson(json["pomar"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "anoPlantio": anoPlantio,
        "distanciaFilas": distanciaFilas,
        "distanciaPlantas": distanciaPlantas,
        "quantidadeColmeias": quantidadeColmeias,
        "pomar": pomar!.toJson(),
      };
}
