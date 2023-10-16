import 'package:flutter/material.dart';
import 'package:imc/model/imc.dart';
import 'package:imc/pages/result_page.dart';

class FormPage extends StatefulWidget {
  final List<Imc> historico;
  const FormPage({super.key, required this.historico});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int alturaEscolhida = 175;
  int pesoEscolhido = 80;

  void handleCalcular() {
    widget.historico.add(Imc(alturaEscolhida, pesoEscolhido));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                  imc: Imc(alturaEscolhida, pesoEscolhido),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 48),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          color: const Color(0xFF1D1F30),
          child: Column(
            children: [
              const Text("Altura",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(alturaEscolhida.toString(),
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(
                    width: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text("cm",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                ],
              ),
              Slider(
                  min: 120,
                  max: 230,
                  value: double.parse(alturaEscolhida.toString()),
                  onChanged: (double value) {
                    setState(() {
                      alturaEscolhida = value.round();
                    });
                  }),
            ],
          ),
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 48),
            color: const Color(0xFF1D1F30),
            child: Column(children: [
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
