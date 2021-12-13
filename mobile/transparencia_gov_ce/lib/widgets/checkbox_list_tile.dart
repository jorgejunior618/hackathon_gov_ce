import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class InvertedCheckBoxListTile extends StatelessWidget {
  const InvertedCheckBoxListTile({
    Key? key,
    required this.texto,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String texto;
  final bool value;
  final Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChange,
        ),
        SimpleText(
          texto,
          textSize: 12,
        ),
      ],
    );
  }
}
