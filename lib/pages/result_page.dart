import 'package:flutter/material.dart';
import 'package:imc/model/imc_model.dart';
import 'package:imc/model/usuario_model.dart';
import 'package:imc/repositories/imc_repository.dart';
import 'package:imc/repositories/usuario_repository.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final IMCRepository _imcRepository = IMCRepository();
  UsuarioModel usuarioModel = UsuarioModel("", 175);
  ImcModel imcModel = ImcModel(0, 0);

  @override
  void initState() {
    super.initState();
    obterLeitura();
  }

  void obterLeitura() async {
    usuarioModel = await UsuarioRepository.obterDados();
    imcModel = await _imcRepository.obterUltimaLeitura();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFF0B0F21),
            appBar: AppBar(
              title: const Text("Calculadora IMC"),
              backgroundColor: const Color(0xFF0B0F21),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá ${usuarioModel.nome}, aqui está seu resultado',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 48),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          color: const Color(0xFF1D1F30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  imcModel
                                      .retornaResultado(imcModel.calcularIMC()),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen),
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 24,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  imcModel.calcularIMC().toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffD83459),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Novo cálculo",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ))),
                    ),
                  ]),
            )));
  }
}
