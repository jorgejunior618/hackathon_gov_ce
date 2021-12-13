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
      "Servidores Públicos",
      'lib/assets/servidores.png',
      '/servidoresPublicos',
    ),
    TipoDado(
      "Notas de empenho",
      'lib/assets/notas_empenho.png',
      '/emConstrucao',
    ),
    TipoDado(
      "Contratos e Convenios",
      'lib/assets/contratos_conv.png',
      '/emConstrucao',
    ),
    TipoDado(
      "Obras públicas",
      'lib/assets/obras.png',
      '/emConstrucao',
    ),
    TipoDado(
      "Combate ao Covid-19",
      'lib/assets/covid.png',
      '/emConstrucao',
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
                urlRedirecionamento: dado.url,
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
    required this.urlRedirecionamento,
  }) : super(key: key);

  final String titulo;
  final String urlImagem;
  final String urlRedirecionamento;

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
          onTap: () {
            Navigator.of(context).pushNamed(urlRedirecionamento, arguments: {
              'title': titulo,
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15.0,
                    left: 5,
                    right: 5,
                  ),
                  child: Image.asset(
                    urlImagem,
                    width: 68,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: SizedBox(
                      height: 50,
                      child: SimpleText(
                        titulo,
                        textSize: 17.0,
                        textAlign: TextAlign.center,
                        fontStyle: CustomTextStyle.subtitle,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 8,
                  margin: const EdgeInsets.only(top: 2),
                  decoration: const BoxDecoration(
                    color: MaterialColors.highlightItem,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(9),
                    ),
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
