// To parse this JSON data, do
//
//     final quadra = quadraFromJson(jsonString);

import 'dart:convert';

import 'CultivarQuadra.dart';
import 'PomarModel.dart';

Quadra quadraFromJson(String str) => Quadra.fromJson(json.decode(str));

String quadraToJson(Quadra data) => json.encode(data.toJson());

class Quadra {
  Quadra({
    required this.id,
    required this.anoPlantio,
    required this.distanciaFilas,
    required this.distanciaPlantas,
    required this.quantidadeColmeias,
    required this.pomar,
    required this.cultivaresQuadra,
  });

  int id;
  int anoPlantio;
  int distanciaFilas;
  int distanciaPlantas;
  int quantidadeColmeias;
  Pomar pomar;
  List<CultivarQuadra> cultivaresQuadra;

  factory Quadra.fromJson(Map<String, dynamic> json) => Quadra(
        id: json["id"],
        anoPlantio: json["anoPlantio"],
        distanciaFilas: json["distanciaFilas"],
        distanciaPlantas: json["distanciaPlantas"],
        quantidadeColmeias: json["quantidadeColmeias"],
        pomar: Pomar.fromJson(json["pomar"]),
        cultivaresQuadra: List<CultivarQuadra>.from(
            json["cultivaresQuadra"].map((x) => CultivarQuadra.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "anoPlantio": anoPlantio,
        "distanciaFilas": distanciaFilas,
        "distanciaPlantas": distanciaPlantas,
        "quantidadeColmeias": quantidadeColmeias,
        "pomar": pomar.toJson(),
        "cultivaresQuadra":
            List<dynamic>.from(cultivaresQuadra.map((x) => x.toJson())),
      };
}
