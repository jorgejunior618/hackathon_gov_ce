import 'package:flutter/material.dart';
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

    const List<Map<String, dynamic>> _noticias = [
      {
        'tag': 'Desenvolvimento sustentavel',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia1.png',
      },
      {
        'tag': 'Coronoa virus (covid-19)',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia2.png',
      },
      {
        'tag': 'saúde',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia3.png',
      },
      {
        'tag': 'Desenvolvimento sustentavel',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia1.png',
      },
      {
        'tag': 'Coronoa virus (covid-19)',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia2.png',
      },
      {
        'tag': 'saúde',
        'data': '10 de dezembro de 2021',
        'titulo': titulo,
        'imagem': 'lib/assets/images/noticia3.png',
      },
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
            for (Map<String, dynamic> noticia in _noticias)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CardNoticia(
                  tag: noticia['tag'],
                  data: '10 de dezembro de 2021',
                  titulo: noticia['titulo'],
                  imagem: noticia['imagem'],
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
    required this.tag,
    required this.data,
    required this.titulo,
    required this.imagem,
  }) : super(key: key);

  final String tag;
  final String data;
  final String titulo;
  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      borderRadius: const BorderRadius.all(Radius.circular(9)),
      elevation: 2.0,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: double.maxFinite,
        height: 166,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          image: DecorationImage(
            image: AssetImage(
              imagem,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          color: Colors.black.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleTextBold(
                tag.toUpperCase(),
                textSize: 13.0,
                textColor: MaterialColors.white,
                fontStyle: CustomTextStyle.title,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SimpleTextBold(
                  data.toUpperCase(),
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
                      titulo,
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
    );
  }
}
