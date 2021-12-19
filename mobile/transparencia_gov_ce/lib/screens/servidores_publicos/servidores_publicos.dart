import 'package:flutter/material.dart';

import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/custom_app_bar.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class ItemNavegacao {
  const ItemNavegacao(this.titulo, this.tela);

  final String titulo;
  final Widget tela;
}

class ServidoresPublicos extends StatelessWidget {
  const ServidoresPublicos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      appBar: CustomAppBar(
        backButtom: true,
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          "Servidores Públicos",
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
      body: ConteudoServidores(),
    );
  }
}

class ConteudoServidores extends StatelessWidget {
  const ConteudoServidores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0, left: 22.0, right: 22.0),
              child: SimpleText(
                'Informações sobre a remuneração dos servidores públicos',
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 18.0),
              reverse: true,
              child: Row(
                children: [
                  for (int i = 2014; i <= 2021; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Material(
                        type: MaterialType.card,
                        color: i == 2021
                            ? MaterialColors.selectedItem
                            : MaterialColors.white,
                        borderRadius: BorderRadius.circular(50),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 22.0,
                          ),
                          child: SimpleText(
                            '$i',
                            textSize: 22,
                            textColor:
                                i == 2021 ? MaterialColors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
              child: Material(
                type: MaterialType.card,
                borderRadius: BorderRadius.circular(9),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SimpleText(
                        'Total Gasto',
                        textSize: 14,
                        textColor: MaterialColors.muted,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SimpleText(
                        'R\$ 32.004.060,40',
                        textSize: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(22, 0, 22, 12),
              child: SimpleText(
                'Clique em um mês para mais detalhes',
              ),
            ),
            const GastosMensais(),
          ],
        ),
      ),
    );
  }
}

class GastosMensais extends StatelessWidget {
  const GastosMensais({
    Key? key,
  }) : super(key: key);

  static const List meses = [
    'Dezembro 2021',
    'Novembro 2021',
    'Outubro 2021',
    'Setembro 2021',
    'Agosto 2021',
    'Julho 2021',
    'Junho 2021',
    'Maio 2021',
    'Abril 2021',
    'Março 2021',
    'Fevereiro 2021',
    'Janeiro 2021',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 12),
      child: Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(9),
        elevation: 2,
        child: Column(
          children: [
            for (String mes in meses)
              CardMes(
                gasto: 'R\$ 24.061,04',
                periodo: mes,
                ultimo: mes.startsWith('Jan'),
              ),
          ],
        ),
      ),
    );
  }
}

class CardMes extends StatelessWidget {
  const CardMes({
    Key? key,
    required this.periodo,
    required this.gasto,
    this.ultimo = false,
  }) : super(key: key);

  final String periodo;
  final String gasto;
  final bool ultimo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/gastoMensal',
                arguments: {
                  'periodo': periodo,
                  'totalGasto': gasto,
                },
              );
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              title: SimpleTextBold(periodo),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: SimpleText(
                      'Total Gasto',
                      textSize: 14,
                      textColor: MaterialColors.muted,
                    ),
                  ),
                  SimpleText(
                    gasto,
                    textSize: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!ultimo)
          Container(
            color: MaterialColors.separator,
            height: 1,
            width: double.maxFinite,
          )
      ],
    );
  }
}
