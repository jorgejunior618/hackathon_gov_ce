import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/models/tipo_dado.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class MenuDados extends StatelessWidget {
  const MenuDados({
    Key? key,
  }) : super(key: key);

  static const listaTiposDados = [
    TipoDado(
      "Servidores Públicos",
      FontAwesomeIcons.users,
    ),
    TipoDado(
      "Contratos e Convenios",
      FontAwesomeIcons.fileContract,
    ),
    TipoDado(
      "Obras públicas",
      FontAwesomeIcons.city,
    ),
    TipoDado(
      "Despesas no combate ao Covid-19",
      FontAwesomeIcons.viruses,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
              top: MediaQuery.of(context).padding.top + 110,
            ),
            child: Column(
              children: MenuDados.listaTiposDados.map<Widget>((TipoDado dado) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CardItemDados(
                    titulo: dado.descricao,
                    icon: dado.icone,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const CabecalhoDados(
          texto: "Como nosso dinheiro está sendo utilizado",
        ),
      ],
    );
  }
}

class CabecalhoDados extends StatelessWidget {
  const CabecalhoDados({
    Key? key,
    this.texto = "Dados",
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MaterialColors.bgColorScreen,
      height: 135,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: MediaQuery.of(context).padding.top + 18,
          bottom: 20,
        ),
        child: Material(
          type: MaterialType.card,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20,
            ),
            child: Center(
              child: SimpleText(
                texto,
                textAlign: TextAlign.center,
                textSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardItemDados extends StatelessWidget {
  const CardItemDados({
    Key? key,
    required this.titulo,
    required this.icon,
  }) : super(key: key);

  final String titulo;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      elevation: 2.0,
      child: InkWell(
        onTap: () {},
        splashColor: MaterialColors.bgColorScreen.withOpacity(0.2),
        highlightColor: MaterialColors.bgColorScreen.withOpacity(0.05),
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 26,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: FaIcon(
                    icon,
                    size: 40,
                  ),
                ),
                Expanded(
                  child: SimpleText(
                    titulo,
                    textSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
