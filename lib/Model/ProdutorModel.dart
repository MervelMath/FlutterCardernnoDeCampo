class Produtor {
  Produtor({
    this.id,
    this.nome,
    this.logradouro,
    this.bairroLocalidade,
    this.cidade,
    this.estado,
    this.cep,
    this.email,
    this.telefone1,
    this.telefone2,
  });

  int? id;
  String? nome;
  String? logradouro;
  String? bairroLocalidade;
  String? cidade;
  String? estado;
  String? cep;
  String? email;
  String? telefone1;
  String? telefone2;

  factory Produtor.fromJson(Map<String, dynamic> json) => Produtor(
        id: json["id"],
        nome: json["nome"],
        logradouro: json["logradouro"],
        bairroLocalidade: json["bairro_localidade"],
        cidade: json["cidade"],
        estado: json["estado"],
        cep: json["cep"],
        email: json["email"],
        telefone1: json["telefone1"],
        telefone2: json["telefone2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "logradouro": logradouro,
        "bairro_localidade": bairroLocalidade,
        "cidade": cidade,
        "estado": estado,
        "cep": cep,
        "email": email,
        "telefone1": telefone1,
        "telefone2": telefone2,
      };
}
