import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

const List<Map<String, dynamic>> questoes = [
  {
    'titulo': 'Qual a finalidade deste aplicativo?',
    'descricao':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at sollicitudin arcu. Vestibulum quis leo justo. Nullam ut fermentum eros. Nunc in augue vestibulum, rutrum mauris placerat, rutrum orci. Duis sed arcu ut elit posuere maximus tempus nec elit. Maecenas ac feugiat velit. In massa mauris, pharetra eu eros at, consectetur gravida nunc.',
  },
  {
    'titulo': 'O que realmente significa tranparência de dados?',
    'descricao':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at sollicitudin arcu. Vestibulum quis leo justo. Nullam ut fermentum eros. Nunc in augue vestibulum, rutrum mauris placerat, rutrum orci. Duis sed arcu ut elit posuere maximus tempus nec elit. Maecenas ac feugiat velit. In massa mauris, pharetra eu eros at, consectetur gravida nunc.',
  },
];

class AjudaApp extends StatelessWidget {
  const AjudaApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 15, 22, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 10.0,
                left: 6,
                right: 6,
              ),
              child: SimpleText(
                'Clique em uma pergunta para mais detalhes',
                textSize: 16,
              ),
            ),
            for (Map<String, dynamic> questao in questoes)
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ItemQuestao(
                  titulo: questao['titulo'],
                  descricao: questao['descricao'],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ItemQuestao extends StatelessWidget {
  const ItemQuestao({
    Key? key,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 14.0),
        tilePadding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        title: SimpleTextBold(
          titulo,
          textSize: 18,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SimpleText(
              descricao,
              textSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
