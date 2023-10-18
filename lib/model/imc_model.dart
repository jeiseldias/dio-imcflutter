import 'dart:math';

class ImcModel {
  int _id = 0;
  int _altura = 0;
  int _peso = 0;

  int get id => _id;
  int get altura => _altura;

  int get peso => _peso;

  set altura(int altura) {
    _altura = altura;
  }

  set peso(int peso) {
    _peso = peso;
  }

  double calcularIMC() {
    return _peso / pow((_altura / 100), 2);
  }

  String retornaResultado(double imc) {
    String resposta;

    switch (imc) {
      case < 16:
        resposta = "magreza grave";
        break;
      case < 17:
        resposta = "magreza moderada";
        break;
      case < 18.5:
        resposta = "magreza leve";
        break;
      case < 25:
        resposta = "saudável";
        break;
      case < 30:
        resposta = "sobrepeso";
        break;
      case < 35:
        resposta = "obesidade I";
        break;
      case < 40:
        resposta = "obesidade II (severa)";
        break;
      default:
        resposta = "obesidade III (mórbida)";
        break;
    }

    return resposta.toUpperCase();
  }

  ImcModel(int altura, int peso) {
    _id = 0;
    _altura = altura;
    _peso = peso;
  }
}
