import 'package:flutter/material.dart';
import 'package:imc/repositories/imc_repository.dart';
import '../model/imc_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  IMCRepository imcRepository = IMCRepository();
  List<ImcModel> _leituras = [];

  @override
  void initState() {
    super.initState();
    obterLeituras();
  }

  void obterLeituras() async {
    _leituras = await imcRepository.obterLeituras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _leituras.length,
      itemBuilder: (BuildContext bc, int index) {
        var currentIMC = _leituras[index];
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
