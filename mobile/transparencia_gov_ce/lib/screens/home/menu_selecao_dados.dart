import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/models/tipo_dado.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class MenuDados extends StatelessWidget {
  const MenuDados({
    Key? key,
  }) : super(key: key);

  static const List listaTiposDados = [
    TipoDado(
      "Notas de empenho",
      'lib/assets/notas_empenho.png',
    ),
    TipoDado(
      "Servidores Públicos",
      'lib/assets/servidores.png',
    ),
    TipoDado(
      "Contratos e Convenios",
      'lib/assets/contratos_conv.png',
    ),
    TipoDado(
      "Obras públicas",
      'lib/assets/obras.png',
    ),
    TipoDado(
      "Combate ao Covid-19",
      'lib/assets/covid.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double childrenWidith = 151;
    double childrenHeight = 160;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.0,
            vertical: 15.0,
          ),
          child: SimpleText(
            "Selecione uma categoria para acompanhar para onde vai o seu dinheiro",
            fontStyle: CustomTextStyle.text,
            textSize: 16,
          ),
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: (childrenWidith / childrenHeight),
            crossAxisCount: 2,
            children: MenuDados.listaTiposDados.map<Widget>((dado) {
              return CardItemDados(
                titulo: dado.descricao,
                urlImagem: dado.imagem,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class CardItemDados extends StatelessWidget {
  const CardItemDados({
    Key? key,
    required this.titulo,
    required this.urlImagem,
  }) : super(key: key);

  final String titulo;
  final String urlImagem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MaterialColors.white,
        boxShadow: const [BoxShadow(blurRadius: 2, offset: Offset(0, 0))],
        borderRadius: BorderRadius.circular(9),
      ),
      height: 200,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(9),
              border: Border(
                bottom: BorderSide(
                  color: MaterialColors.highlightItem,
                  width: 8.0,
                ),
              ),
            ),
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 2,
              left: 5,
              right: 5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Image.asset(
                    urlImagem,
                    width: 68,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: SimpleText(
                    titulo,
                    textSize: 17.0,
                    textAlign: TextAlign.center,
                    fontStyle: CustomTextStyle.subtitle,
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
