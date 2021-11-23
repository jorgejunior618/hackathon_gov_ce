import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String _text;
  final double textSize;
  final TextAlign textAlign;
  final Color textColor;

  const SimpleText(
    this._text, {
    Key? key,
    this.textSize = 16.0,
    this.textAlign = TextAlign.left,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}

class SimpleTextBold extends StatelessWidget {
  final String _text;
  final double textSize;
  final TextAlign textAlign;
  final Color textColor;

  const SimpleTextBold(
    this._text, {
    Key? key,
    this.textSize = 16.0,
    this.textAlign = TextAlign.left,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
      overflow: TextOverflow.clip,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
