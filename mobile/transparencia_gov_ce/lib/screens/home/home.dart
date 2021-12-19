import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/screens/home/ajuda.dart';
import 'package:transparencia_gov_ce/screens/home/configuracoes.dart';
import 'package:transparencia_gov_ce/screens/home/menu_selecao_dados.dart';
import 'package:transparencia_gov_ce/screens/home/noticias.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/utils/functions.util.dart';
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
  bool podeSair = false;

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
    return WillPopScope(
      onWillPop: () async {
        if (!podeSair) {
          setState(() {
            podeSair = true;
          });
          FunctionsUtil.showSnackBarFecharApp(
            context,
            color: _abaSelecionada == 0
                ? MaterialColors.selectedItem.withOpacity(0.8)
                : Colors.black.withOpacity(0.55),
            bottomDistance: _abaSelecionada == 0
                ? 0
                : ((MediaQuery.of(context).size.height / 2) - 100),
          );
          Future.delayed(const Duration(seconds: 4)).then((value) {
            setState(() {
              podeSair = false;
            });
          });
          return false;
        } else {
          setState(() {
            podeSair = false;
          });
          return true;
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
