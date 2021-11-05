class ResponsavelTecnico {
  final int? id;
  final String? nome;
  final String? logradouro;
  final String? bairroLocalidade;
  final String? cidade;
  final String? estado;
  final String? cep;
  final String? email;
  final String? telefone1;
  final String? telefone2;
  final String? crea;

  ResponsavelTecnico({
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
    this.crea,
  });

  factory ResponsavelTecnico.fromJson(Map<String, dynamic> json) {
    return ResponsavelTecnico(
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
      crea: json["crea"],
    );
  }
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
        "crea": crea,
      };
}
