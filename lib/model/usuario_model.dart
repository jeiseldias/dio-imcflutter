class UsuarioModel {
  String _nome;
  int _altura;

  UsuarioModel(this._nome, this._altura);

  String get nome => _nome;
  int get altura => _altura;

  set nome(String nome) {
    _nome = nome;
  }

  set altura(int altura) {
    _altura = altura;
  }
}
