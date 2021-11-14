// To parse this JSON data, do
//
//     final cUltivarQuadra = cUltivarQuadraFromJson(jsonString);

import 'dart:convert';

import 'package:updatetest_nulableversion/Model/PortaEnxerto.dart';

import 'CultivarModel.dart';

CultivarQuadra cUltivarQuadraFromJson(String str) =>
    CultivarQuadra.fromJson(json.decode(str));

String cUltivarQuadraToJson(CultivarQuadra data) => json.encode(data.toJson());

class CultivarQuadra {
  CultivarQuadra({
    required this.enxerto,
    required this.cultivar,
    required this.quantidade,
  });

  PortaEnxerto enxerto;
  Cultivar cultivar;
  int quantidade;

  factory CultivarQuadra.fromJson(Map<String, dynamic> json) => CultivarQuadra(
        enxerto: PortaEnxerto.fromJson(json["enxerto"]),
        cultivar: Cultivar.fromJson(json["cultivar"]),
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "enxerto": enxerto.toJson(),
        "cultivar": cultivar.toJson(),
        "quantidade": quantidade,
      };
}
