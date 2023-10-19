import 'package:flutter/material.dart';
import 'package:imc/model/imc_model.dart';
import 'package:imc/model/usuario_model.dart';
import 'package:imc/pages/result_page.dart';
import 'package:imc/repositories/imc_repository.dart';
import 'package:imc/repositories/usuario_repository.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  IMCRepository imcRepository = IMCRepository();
  int pesoEscolhido = 80;

  void handleCalcular() async {
    UsuarioModel dadosUsuario = await UsuarioRepository.obterDados();
    await imcRepository
        .salvarLeitura(ImcModel(dadosUsuario.altura, pesoEscolhido));
    irParaResultado();
  }

  void irParaResultado() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResultPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              width: double.infinity,
              color: const Color(0xFF1D1F30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Peso",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pesoEscolhido.toString(),
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(
                          width: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text("kg",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              pesoEscolhido++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xff4D4E5D),
                          ),
                          child: const Text(
                            "+",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              pesoEscolhido--;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xff4D4E5D),
                          ),
                          child: const Text(
                            "-",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ])),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          child: TextButton(
            onPressed: handleCalcular,
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xffD83459),
                foregroundColor: Colors.white),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
