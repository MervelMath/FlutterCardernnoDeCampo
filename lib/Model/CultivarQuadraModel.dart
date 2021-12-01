import 'dart:convert';

import 'package:updatetest_nulableversion/Model/PortaEnxertoModel.dart';

import 'CultivarModel.dart';
import 'QuadraModel.dart';

CultivarQuadra cultivarQuadraFromJson(String str) =>
    CultivarQuadra.fromJson(json.decode(str));

String cultivarQuadraToJson(CultivarQuadra data) => json.encode(data.toJson());

class CultivarQuadra {
  CultivarQuadra(
      {required this.id,
      this.quadra,
      required this.enxerto,
      required this.cultivar,
      required this.quantidade});

  int id;
  Quadra? quadra;
  PortaEnxerto enxerto;
  Cultivar cultivar;
  int quantidade;

  factory CultivarQuadra.fromJson(Map<String, dynamic> json) => CultivarQuadra(
        id: json["id"],
        enxerto: PortaEnxerto.fromJson(json["enxerto"]),
        cultivar: Cultivar.fromJson(json["cultivar"]),
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quadra": quadra!.toJson(),
        "enxerto": enxerto.toJson(),
        "cultivar": cultivar.toJson(),
        "quantidade": quantidade,
      };
}
