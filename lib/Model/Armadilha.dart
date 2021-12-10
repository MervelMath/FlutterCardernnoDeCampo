import 'dart:convert';

import 'QuadraModel.dart';

Armadilha armadilhaFromJson(String str) => Armadilha.fromJson(json.decode(str));

String armadilhaToJson(Armadilha data) => json.encode(data.toJson());

class Armadilha {
  Armadilha({
    this.id,
    this.latitude,
    this.longitude,
    this.localizacaoTexto,
    this.quadra,
  });

  int? id;
  double? latitude;
  double? longitude;
  String? localizacaoTexto;
  Quadra? quadra;

  factory Armadilha.fromJson(Map<String, dynamic> json) => Armadilha(
        id: json["id"],
        latitude: json["latitude"],
        longitude: json["longitude"].toDouble(),
        localizacaoTexto: json["localizacaoTexto"],
        quadra: Quadra.fromJson(json["quadra"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "localizacaoTexto": localizacaoTexto,
        "quadra": quadra?.toJson(),
      };
}
