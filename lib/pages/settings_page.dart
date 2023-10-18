import 'package:flutter/material.dart';
import 'package:imc/model/usuario_model.dart';
import 'package:imc/repositories/usuario_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UsuarioRepository _usuarioRepository = UsuarioRepository();
  UsuarioModel _usuarioModel = UsuarioModel("", 175);
  TextEditingController _nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterDados();
  }

  void handleSalvar() {
    _usuarioModel.nome = _nomeController.text;
    _usuarioRepository.alterarDados(_usuarioModel);
  }

  void obterDados() async {
    _usuarioModel = await _usuarioRepository.obterDados();
    _nomeController.text = _usuarioModel.nome;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 48),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            color: const Color(0xFF1D1F30),
            child: Column(
              children: [
                const Text("Seu nome",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 48),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            color: const Color(0xFF1D1F30),
            child: Column(
              children: [
                const Text("Sua altura",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_usuarioModel.altura.toString(),
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
                    value: double.parse(_usuarioModel.altura.toString()),
                    onChanged: (double value) {
                      setState(() {
                        _usuarioModel.altura =
                            int.parse(value.round().toString());
                      });
                    }),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: handleSalvar,
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffD83459),
                  foregroundColor: Colors.white),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Salvar dados pessoais",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
