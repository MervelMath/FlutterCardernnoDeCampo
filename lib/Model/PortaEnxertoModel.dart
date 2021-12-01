import 'dart:convert';

PortaEnxerto portaEnxertoFromJson(String str) =>
    PortaEnxerto.fromJson(json.decode(str));

String portaEnxertoToJson(PortaEnxerto data) => json.encode(data.toJson());

class PortaEnxerto {
  PortaEnxerto({
    required this.id,
    required this.nome,
  });

  int id;
  String nome;

  factory PortaEnxerto.fromJson(Map<String, dynamic> json) => PortaEnxerto(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
