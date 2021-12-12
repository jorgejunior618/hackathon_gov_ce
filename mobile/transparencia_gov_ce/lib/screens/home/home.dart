import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/screens/home/menu_selecao_dados.dart';
import 'package:transparencia_gov_ce/screens/home/noticias.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/custom_app_bar.dart';
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
    MenuDados(),
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
      appBar: const CustomAppBar(
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          'Notícias',
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
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
            label: "Transparência",
            tooltip: "Transparência",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.settings_outlined),
            label: "Configurações",
            tooltip: "Configurações",
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
