import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/custom_app_bar.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class EmConstrucao extends StatefulWidget {
  const EmConstrucao({
    Key? key,
  }) : super(key: key);

  @override
  State<EmConstrucao> createState() => _EmConstrucaoState();
}

class ItemNavegacao {
  const ItemNavegacao(this.titulo, this.tela);

  final String titulo;
  final Widget tela;
}

class _EmConstrucaoState extends State<EmConstrucao> {
  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;

    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      appBar: CustomAppBar(
        backButtom: true,
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          arguments!['title'] ?? "",
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            FaIcon(
              FontAwesomeIcons.cogs,
              size: 80,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: SimpleText(
                'Em Construção ...',
                textSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
