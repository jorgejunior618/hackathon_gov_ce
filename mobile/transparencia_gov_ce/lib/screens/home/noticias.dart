import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

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
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
              top: MediaQuery.of(context).padding.top + 85,
            ),
            child: Column(
              children: [
                for (int i = 0; i < 7; i++)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: CardNoticia(tag: tag, titulo: titulo),
                  ),
              ],
            ),
          ),
        ),
        const BarraNotificacoes(),
      ],
    );
  }
}

class BarraNotificacoes extends StatelessWidget {
  const BarraNotificacoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MaterialColors.bgColorScreen,
      height: 100,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: MediaQuery.of(context).padding.top + 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardTipoNotificacao(
              cardColor: MaterialColors.whatsApp,
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            CardTipoNotificacao(
              cardColor: MaterialColors.telegram,
              icon: const FaIcon(
                FontAwesomeIcons.telegram,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.notifications_on_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTipoNotificacao extends StatelessWidget {
  const CardTipoNotificacao({
    Key? key,
    this.cardColor = Colors.blue,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  final Color cardColor;
  final FaIcon? icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      elevation: 2.0,
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 140,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SimpleText("Noticia via ", textColor: Colors.white),
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: icon,
                  ),
              ],
            ),
          ),
        ),
      ),
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
      elevation: 2.0,
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
