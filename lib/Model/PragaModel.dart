import 'dart:convert';

List<Praga> pragaFromJson(String str) =>
    List<Praga>.from(json.decode(str).map((x) => Praga.fromJson(x)));

String pragaToJson(List<Praga> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Praga {
  Praga({
    required this.id,
    required this.nome,
  });

  int id;
  String nome;

  factory Praga.fromJson(Map<String, dynamic> json) => Praga(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
