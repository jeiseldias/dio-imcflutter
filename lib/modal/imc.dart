import 'dart:math';

class Imc {
  double _altura = 0;
  double _peso = 0;

  double get altura => _altura;

  double get peso => _peso;

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }

  String calcularIMC() {
    return (peso / pow(altura, 2)).toStringAsFixed(2);
  }

  Imc(String altura, String peso) {
    _altura = double.parse(altura.replaceAll(",", "."));
    _peso = double.parse(peso.toString());
  }
}
