class Noticia {
  Noticia(
    this.tag,
    this.data,
    this.titulo,
    this.texto,
    this.imagem,
  );

  final String tag;
  final String data;
  final String titulo;
  final String texto;
  final String imagem;

  @override
  String toString() {
    return 'Noticia: {\n'
        '  tag: $tag,\n'
        '  data: $data,\n'
        '  titulo: $titulo,\n'
        '  texto: $texto,\n'
        '  imagem: $imagem,\n'
        '}';
  }
}
