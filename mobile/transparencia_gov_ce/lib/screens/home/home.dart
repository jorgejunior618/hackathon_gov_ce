import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/screens/home/noticias.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _abaSelecionada = 0;

  static const List<Widget> _abas = <Widget>[
    Noticias(),
    SimpleText(
      'Index 1: Business',
      textColor: Colors.white,
      textSize: 36.0,
    ),
  ];

  void _selecionarAba(int index) {
    setState(() {
      _abaSelecionada = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      body: Center(
        child: _abas.elementAt(_abaSelecionada),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.newspaper),
            label: "Notícias",
            tooltip: "Notícias",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dollarSign),
            label: "Gastos",
            tooltip: "Gastos",
          ),
        ],
        currentIndex: _abaSelecionada,
        selectedItemColor: MaterialColors.primary,
        selectedFontSize: 16,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedFontSize: 12,
        unselectedIconTheme: const IconThemeData(size: 20),
        onTap: _selecionarAba,
      ),
    );
  }
}
