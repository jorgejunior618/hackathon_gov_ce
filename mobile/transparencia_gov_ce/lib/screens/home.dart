import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Noticias(),
    SimpleText(
      'Index 1: Business',
      textColor: Colors.white,
      textSize: 36.0,
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
      backgroundColor: MaterialColors.bgColorScreen,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        selectedItemColor: MaterialColors.primary,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 36),
        unselectedFontSize: 16,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Noticias extends StatelessWidget {
  const Noticias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titulo =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
    const tag = 'saúde';

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Padding(
            padding: const EdgeInsets.only(top: 135.0),
            child: Column(
              children: [
                for (int i = 0; i < 7; i++)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: CardNoticia(tag: tag, titulo: titulo),
                  ),
              ],
            ),
          ),
        ),
        Container(
          color: MaterialColors.bgColorScreen,
          height: 110,
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: MediaQuery.of(context).padding.top,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Material(
                  type: MaterialType.button,
                  color: MaterialColors.whatsApp,
                  child: SizedBox(
                    width: 140,
                    height: 40,
                  ),
                ),
                Material(
                  type: MaterialType.button,
                  color: MaterialColors.telegram,
                  child: SizedBox(
                    width: 140,
                    height: 40,
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Icon(
                    Icons.notifications_on_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardNoticia extends StatelessWidget {
  const CardNoticia({
    Key? key,
    required this.tag,
    required this.titulo,
  }) : super(key: key);

  final String tag;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      elevation: 4.0,
      child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: SimpleTextBold(
                          tag,
                          textSize: 12.0,
                        ),
                      ),
                      SimpleText(
                        titulo,
                        textSize: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 140,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
