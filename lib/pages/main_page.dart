import 'package:flutter/material.dart';
import 'package:imc/modal/imc.dart';
import 'package:imc/pages/form_page.dart';
import 'package:imc/pages/history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int pageNumber = 0;
  List<Imc> historico = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B0F21),
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
          backgroundColor: const Color(0xFF0B0F21),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pageNumber = value;
                  });
                },
                children: const [
                  FormPage(),
                  HistoryPage(),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: const Color(0xFF0B0F21),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: pageNumber,
            items: const [
              BottomNavigationBarItem(
                  label: "Calculadora", icon: Icon(Icons.calculate)),
              BottomNavigationBarItem(
                  label: "Histórico", icon: Icon(Icons.history)),
            ],
          ),
        ]),
      ),
    );
  }
}
