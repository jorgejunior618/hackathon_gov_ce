import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/models/noticia.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/custom_app_bar.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class NoticiaCompleta extends StatelessWidget {
  const NoticiaCompleta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    Noticia noticia = arguments!['noticia'];

    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      appBar: const CustomAppBar(
        backButtom: true,
        backgroundColor: MaterialColors.primary,
        title: SimpleTextBold(
          'Notícias',
          textColor: MaterialColors.white,
          textSize: 17.0,
        ),
      ),
      body: ConteudoNoticia(noticia: noticia),
    );
  }
}

class ConteudoNoticia extends StatelessWidget {
  const ConteudoNoticia({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 25,
        ),
        child: Material(
          type: MaterialType.card,
          elevation: 2,
          borderRadius: BorderRadius.circular(9),
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SimpleText(
                            noticia.tag,
                            textSize: 14,
                            textColor: MaterialColors.primary,
                          ),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MaterialColors.primary,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(Icons.add,
                                  color: MaterialColors.primary, size: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SimpleTextBold(
                      noticia.titulo,
                      textSize: 21,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SimpleTextBold(
                      noticia.data,
                      textSize: 13,
                      textColor: MaterialColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(noticia.imagem),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SimpleText(
                      noticia.texto,
                      textSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
