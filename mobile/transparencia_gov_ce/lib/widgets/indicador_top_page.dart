import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';

import 'package:transparencia_gov_ce/widgets/typography.dart';

class Indicador extends StatelessWidget {
  const Indicador(
    this.texto, {
    Key? key,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(bottom: 8),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: SimpleTextBold(
        texto,
        textSize: 20,
        textColor: MaterialColors.muted,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

class BarraProgresso extends StatelessWidget {
  final int totalEtapas;

  /// Considerando a Etapa Inicial == 1, ou seja, se há 3 etapas
  /// a Inicial é etapa 1, e a Final é a etapa 3
  final int etapaAtual;

  const BarraProgresso(
    this.totalEtapas,
    this.etapaAtual, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        for (int i = 0; i < etapaAtual; i++)
          Expanded(
            child: Container(
              height: 4,
              color: MaterialColors.success,
            ),
          ),
        for (int i = 0; i < totalEtapas - etapaAtual; i++)
          Expanded(
            child: Container(
              height: 4,
              color: MaterialColors.muted,
            ),
          ),
      ],
    );
  }
}
