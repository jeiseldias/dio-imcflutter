import 'package:flutter/material.dart';
import '../model/imc.dart';

class HistoryPage extends StatefulWidget {
  final List<Imc> historico;
  const HistoryPage({super.key, required this.historico});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.historico.length,
      itemBuilder: (BuildContext bc, int index) {
        var currentIMC = widget.historico[index];
        return ListTile(
          title: Text(
            currentIMC.retornaResultado(currentIMC.calcularIMC()),
            style: const TextStyle(color: Colors.lightGreen),
          ),
          subtitle: Text(
            "${currentIMC.altura.toString()}cm - ${currentIMC.peso.toString()} kg",
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Text(
            "IMC: ${currentIMC.calcularIMC().toStringAsFixed(2)}",
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
