import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/models/noticia.dart';
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
    const texto =
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';

    List<Noticia> _noticias = [
      Noticia(
        'Desenvolvimento sustentavel',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia1.png',
      ),
      Noticia(
        'Coronoa virus (covid-19)',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia2.png',
      ),
      Noticia(
        'saúde',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia3.png',
      ),
      Noticia(
        'Desenvolvimento sustentavel',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia1.png',
      ),
      Noticia(
        'Coronoa virus (covid-19)',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia2.png',
      ),
      Noticia(
        'saúde',
        '10 de dezembro de 2021',
        titulo,
        texto,
        'lib/assets/images/noticia3.png',
      ),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          top: 14.0,
        ),
        child: Column(
          children: [
            for (Noticia noticia in _noticias)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CardNoticia(
                  noticia: noticia,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CardNoticia extends StatelessWidget {
  const CardNoticia({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      borderRadius: const BorderRadius.all(Radius.circular(9)),
      elevation: 2.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            width: double.maxFinite,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: AssetImage(
                  noticia.imagem,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(9),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.4, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleTextBold(
                    noticia.tag.toUpperCase(),
                    textSize: 13.0,
                    textColor: MaterialColors.white,
                    fontStyle: CustomTextStyle.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SimpleTextBold(
                      noticia.data.toUpperCase(),
                      textSize: 8.0,
                      textColor: MaterialColors.white,
                      fontStyle: CustomTextStyle.text,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        width: 2,
                        height: 45,
                        color: MaterialColors.primary,
                      ),
                      Expanded(
                        child: SimpleText(
                          noticia.titulo,
                          textSize: 16.0,
                          textColor: MaterialColors.white,
                          fontStyle: CustomTextStyle.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(9),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/NoticiaCompleta',
                  arguments: {'noticia': noticia},
                );
              },
              splashColor: MaterialColors.primary.withOpacity(0.3),
              highlightColor: MaterialColors.selectedItem.withOpacity(0.05),
              child: const SizedBox(
                width: double.infinity,
                height: 166,
              ),
            ),
          )
        ],
      ),
    );
  }
}
