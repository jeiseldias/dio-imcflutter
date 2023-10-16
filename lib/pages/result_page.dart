import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
                    const Text(
                      "Seu resultado",
                      style: TextStyle(
                          fontSize: 35,
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "SOBREPESO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 24,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "27.52",
                                  style: TextStyle(
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