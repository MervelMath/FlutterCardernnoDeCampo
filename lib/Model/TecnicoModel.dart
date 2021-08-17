class ResponsavelTecnico {
  final int idRespTecnico;
  final String nome;
  final String logradouro;
  final String bairroLocalidade;
  final String cidade;
  final String estado;
  final String cep;
  final String email;
  final String telefone1;
  final String telefone2;
  final String crea;

  ResponsavelTecnico({
    required this.idRespTecnico,
    required this.nome,
    required this.logradouro,
    required this.bairroLocalidade,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.email,
    required this.telefone1,
    required this.telefone2,
    required this.crea,
  });

  factory ResponsavelTecnico.fromJson(Map<String, dynamic> json) {
    return ResponsavelTecnico(
      idRespTecnico: json["IDRespTecnico"],
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
}
