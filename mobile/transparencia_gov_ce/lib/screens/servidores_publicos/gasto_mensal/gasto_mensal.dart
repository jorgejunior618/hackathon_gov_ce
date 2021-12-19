import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/models/servidor_publico.dart';

import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/custom_app_bar.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class GastosMensaisServidores extends StatelessWidget {
  const GastosMensaisServidores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;

    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      appBar: const CustomAppBar(
        backButtom: true,
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          "Servidores Públicos",
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
      body: ConteudoGastoServidores(arguments: arguments),
    );
  }
}

class ConteudoGastoServidores extends StatelessWidget {
  const ConteudoGastoServidores({
    Key? key,
    this.arguments,
  }) : super(key: key);

  final Map? arguments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 0, 22, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleTextBold(
                    arguments!['periodo'],
                    textSize: 16,
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
                    children: [
                      const SimpleText(
                        'Total Gasto',
                        textSize: 14,
                        textColor: MaterialColors.muted,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SimpleText(
                        arguments!['totalGasto'],
                        textSize: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Servidores(),
          ],
        ),
      ),
    );
  }
}

class Servidores extends StatelessWidget {
  const Servidores({
    Key? key,
  }) : super(key: key);

  static List<ServidorPublico> servidores = [
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
    ServidorPublico(
      'Emerson Cavalho de Lima',
      'R\$ 30.899,89',
      'Auditor de Controle',
      'CGE',
      'Ativo',
      'R\$ 30.899,89',
      'R\$ 20.000,00',
      'R\$ 10.899,89',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 12),
      child: Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(9),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              for (ServidorPublico servidor in servidores)
                CardServidor(
                  servidor: servidor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardServidor extends StatelessWidget {
  const CardServidor({
    Key? key,
    required this.servidor,
    this.ultimo = false,
  }) : super(key: key);

  final ServidorPublico servidor;
  final bool ultimo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          tilePadding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          childrenPadding: const EdgeInsets.only(left: 20),
          title: SimpleTextBold(servidor.nome),
          subtitle: SimpleText(
            servidor.gasto,
            textSize: 12,
            textColor: MaterialColors.muted,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DadoServidor(
                  titulo: 'Cargo',
                  dado: servidor.cargo,
                ),
                DadoServidor(
                  titulo: 'Órgão',
                  dado: servidor.orgao,
                ),
                DadoServidor(
                  titulo: 'Situação',
                  dado: servidor.situacao,
                ),
                DadoServidor(
                  titulo: 'Salário Bruto',
                  dado: servidor.salario,
                ),
                DadoServidor(
                  titulo: 'Total Descotos',
                  dado: servidor.descontos,
                ),
                DadoServidor(
                  titulo: 'Salário Líquido',
                  dado: servidor.salarioLiquido,
                ),
              ],
            )
          ],
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

class DadoServidor extends StatelessWidget {
  const DadoServidor({
    Key? key,
    required this.titulo,
    required this.dado,
  }) : super(key: key);

  final String titulo;
  final String dado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SimpleTextBold(
            titulo,
            textSize: 12,
          ),
          SimpleText(
            dado,
            textSize: 12,
          ),
        ],
      ),
    );
  }
}
