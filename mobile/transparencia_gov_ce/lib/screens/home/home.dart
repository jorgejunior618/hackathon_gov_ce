import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/screens/home/ajuda.dart';
import 'package:transparencia_gov_ce/screens/home/configuracoes.dart';
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

class ItemNavegacao {
  const ItemNavegacao(this.titulo, this.tela);

  final String titulo;
  final Widget tela;
}

class _HomeState extends State<Home> {
  int _abaSelecionada = 0;

  static const List<ItemNavegacao> _abas = <ItemNavegacao>[
    ItemNavegacao("Notícias", Noticias()),
    ItemNavegacao("Transparência", MenuDados()),
    ItemNavegacao("Configurações", ConfiguracoesApp()),
    ItemNavegacao("Ajuda", AjudaApp()),
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
      appBar: CustomAppBar(
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          _abas.elementAt(_abaSelecionada).titulo,
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
      body: _abas.elementAt(_abaSelecionada).tela,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.newspaper),
            activeIcon: SizedBox(
              height: 34,
              width: 34,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MaterialColors.selectedItem,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.newspaper,
                      color: MaterialColors.white,
                    ),
                  ),
                ),
              ),
            ),
            label: "Notícias",
            tooltip: "Notícias",
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.attach_money_rounded),
            activeIcon: SizedBox(
              height: 34,
              width: 34,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MaterialColors.selectedItem,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const FaIcon(
                      Icons.attach_money_rounded,
                      color: MaterialColors.white,
                    ),
                  ),
                ),
              ),
            ),
            label: "Transparência",
            tooltip: "Transparência",
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.settings_outlined),
            activeIcon: SizedBox(
              height: 34,
              width: 34,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MaterialColors.selectedItem,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const FaIcon(
                      Icons.settings_outlined,
                      color: MaterialColors.white,
                    ),
                  ),
                ),
              ),
            ),
            label: "Configurações",
            tooltip: "Configurações",
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.help_outline),
            activeIcon: SizedBox(
              height: 34,
              width: 34,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MaterialColors.selectedItem,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const FaIcon(
                      Icons.help_outline,
                      color: MaterialColors.white,
                    ),
                  ),
                ),
              ),
            ),
            label: "Ajuda",
            tooltip: "Ajuda",
          ),
        ],
        currentIndex: _abaSelecionada,
        selectedItemColor: MaterialColors.selectedItem,
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        unselectedItemColor: MaterialColors.muted,
        unselectedIconTheme: const IconThemeData(size: 28),
        onTap: _selecionarAba,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
