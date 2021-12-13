import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/checkbox_list_tile.dart';
import 'package:transparencia_gov_ce/widgets/input.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

enum _Configuracao {
  notificacoes,
  noticias,
}

class ConfiguracoesApp extends StatelessWidget {
  const ConfiguracoesApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ItemConfiguracao(
            titulo: 'Notificações',
            descricao: 'Selecione as configurações que você'
                ' deseja para as notificações',
            configuracao: _Configuracao.notificacoes,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: (MediaQuery.of(context).size.width - 44) / 2,
            height: 1,
            color: MaterialColors.separator,
          ),
          const ItemConfiguracao(
            titulo: 'Notícias',
            descricao: 'Personalize quais '
                'categorias'
                ' de notícias deseja receber',
            configuracao: _Configuracao.noticias,
          ),
        ],
      ),
    );
  }
}

class ItemConfiguracao extends StatelessWidget {
  const ItemConfiguracao({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.configuracao,
  }) : super(key: key);

  final String titulo;
  final String descricao;
  final _Configuracao configuracao;

  Widget get controle {
    switch (configuracao) {
      case _Configuracao.notificacoes:
        return const ControleNotificacao();
      case _Configuracao.noticias:
        return const ControleNoticias();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SimpleText(
            titulo,
            textSize: 23,
            fontStyle: CustomTextStyle.subtitle,
            textColor: MaterialColors.primary,
          ),
        ),
        SimpleText(
          descricao,
          textSize: 12,
        ),
        controle,
      ],
    );
  }
}

class ControleNotificacao extends StatefulWidget {
  const ControleNotificacao({
    Key? key,
  }) : super(key: key);

  @override
  _ControleNotificacaoState createState() => _ControleNotificacaoState();
}

class _ControleNotificacaoState extends State<ControleNotificacao> {
  bool notificacoesPush = false;
  bool notificacoesWhatsApp = false;
  bool notificacoesTelegram = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InvertedCheckBoxListTile(
          texto: 'Habilitar notificações do app',
          value: notificacoesPush,
          onChange: (bool? value) {
            setState(() {
              notificacoesPush = !notificacoesPush;
            });
          },
        ),
        InvertedCheckBoxListTile(
          texto: 'Habilitar notificações pelo WhatsApp',
          value: notificacoesWhatsApp,
          onChange: (bool? value) {
            setState(() {
              notificacoesWhatsApp = !notificacoesWhatsApp;
            });
          },
        ),
        InvertedCheckBoxListTile(
          texto: 'Receber notificações pelo Telegram',
          value: notificacoesTelegram,
          onChange: (bool? value) {
            setState(() {
              notificacoesTelegram = !notificacoesTelegram;
            });
          },
        ),
      ],
    );
  }
}

class ControleNoticias extends StatefulWidget {
  const ControleNoticias({
    Key? key,
  }) : super(key: key);

  static const List<Map<String, dynamic>> opcoes = [
    {
      'nome': 'Combate ao Covid',
      'id': 1,
    },
    {
      'nome': 'Saúde',
      'id': 2,
    },
    {
      'nome': 'Desenvolvimento Sustentável',
      'id': 3,
    },
  ];

  @override
  _ControleNoticiasState createState() => _ControleNoticiasState();
}

class _ControleNoticiasState extends State<ControleNoticias> {
  List<Map<String, dynamic>> itensPreferidos = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: SearchSelectDropdown(
            hintText: 'Ex: Segurança Pública',
            list: ControleNoticias.opcoes,
            onChange: (String? newValue) {
              if (newValue != null && newValue.isNotEmpty) {
                List<String> valores = newValue.split('--');
                String nome = valores[0];
                String id = valores[1];

                bool itemExiste = itensPreferidos
                        .indexWhere((element) => element['id'] == id) !=
                    -1;

                if (!itemExiste) {
                  setState(() {
                    itensPreferidos.add({
                      'nome': nome,
                      'id': id,
                    });
                  });
                }
              }
            },
          ),
        ),
        for (Map<String, dynamic> item in itensPreferidos)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              type: MaterialType.card,
              elevation: 2,
              borderRadius: BorderRadius.circular(9),
              child: ListTile(
                title: SimpleText(item['nome']),
                contentPadding: const EdgeInsets.fromLTRB(16, 2, 4, 2),
                trailing: Material(
                  borderRadius: BorderRadius.circular(50),
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        itensPreferidos.removeWhere((element) {
                          return element['id'] == item['id'];
                        });
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: FaIcon(
                        FontAwesomeIcons.trashAlt,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
