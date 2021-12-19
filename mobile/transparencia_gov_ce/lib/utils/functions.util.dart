import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class FunctionsUtil {
  static void showSnackBarFecharApp(
    BuildContext context, {
    required Color color,
    required double bottomDistance,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 18),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const SimpleText(
            'Para sair, pressione "voltar" novamente',
            textColor: MaterialColors.white,
            textAlign: TextAlign.center,
            textSize: 16,
          ),
        ),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(
          bottom: bottomDistance,
        ),
      ),
    );
  }
}
