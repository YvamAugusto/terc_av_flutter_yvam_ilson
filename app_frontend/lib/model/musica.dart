class Musica {
  dynamic id;
  dynamic nome;
  dynamic album;
  dynamic autor;
  dynamic genero;
  dynamic ano;
  dynamic duracao;

  // Musica(this.id, this.nome, this.album, this.autor, this.genero, this.ano, this.duracao);

  Musica({
    required this.id,
    required this.nome,
    required this.album,
    required this.autor,
    required this.genero,
    required this.ano,
    required this.duracao,
  });

  factory Musica.fromJson(Map<String, dynamic> json) {
    return Musica(
      id: json['id'],
      nome: json['nome'],
      album: json['album'],
      autor: json['autor'],
      genero: json['genero'],
      ano: json['ano'],
      duracao: json['duracao'],
    );
  }

  // Musica.iniciar() {
  //   id = 0;
  //   nome = "";
  //   album = "";
  //   autor = "";
  //   genero = "";
  //   ano = 0;
  //   duracao = "";
  // }
}
