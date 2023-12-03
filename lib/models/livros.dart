class Livro {
  int? id; // Identificador único no banco de dados
  final String titulo;
  final String autor;
  final String genero;
  final int numeroPaginas; // Alterado para int para compatibilidade com SQLite
  final int anoLancamento; // Alterado para int para compatibilidade com SQLite

  Livro({
    this.id,
    required this.titulo,
    required this.autor,
    required this.genero,
    required this.numeroPaginas,
    required this.anoLancamento,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'genero': genero,
      'numeroPaginas': numeroPaginas,
      'anoLancamento': anoLancamento,
    };
  }

  factory Livro.fromMap(Map<String, dynamic> map) {
    return Livro(
      id: map['id'],
      titulo: map['titulo'],
      autor: map['autor'],
      genero: map['genero'],
      numeroPaginas: map['numeroPaginas'],
      anoLancamento: map['anoLancamento'],
    );
  }

  @override
  String toString() {
    return 'Livro{ id: $id, titulo: $titulo, autor: $autor, genero: $genero, numeroPaginas: $numeroPaginas, anoLancamento: $anoLancamento}';
  }
}
