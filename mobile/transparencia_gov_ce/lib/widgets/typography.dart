import 'package:flutter/material.dart';

enum CustomTextStyle {
  title,
  subtitle,
  text,
}

class SimpleText extends StatelessWidget {
  const SimpleText(
    this._text, {
    Key? key,
    this.textSize = 16.0,
    this.textAlign = TextAlign.left,
    this.textColor = Colors.black,
    this.fontStyle = CustomTextStyle.text,
  }) : super(key: key);

  final String _text;
  final double textSize;
  final TextAlign textAlign;
  final Color textColor;
  final CustomTextStyle fontStyle;

  String get fontFamily {
    switch (fontStyle) {
      case CustomTextStyle.text:
        return "Open Sans";
      case CustomTextStyle.subtitle:
        return "Geomanist";
      case CustomTextStyle.title:
        return "Isidora Sans";
      default:
        return "Open Sans";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
      overflow: TextOverflow.clip,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontFamily: fontFamily,
      ),
    );
  }
}

class SimpleTextBold extends StatelessWidget {
  const SimpleTextBold(
    this._text, {
    Key? key,
    this.textSize = 16.0,
    this.textAlign = TextAlign.left,
    this.textColor = Colors.black,
    this.fontStyle = CustomTextStyle.title,
  }) : super(key: key);

  final String _text;
  final double textSize;
  final TextAlign textAlign;
  final Color textColor;
  final CustomTextStyle fontStyle;

  String get fontFamily {
    switch (fontStyle) {
      case CustomTextStyle.text:
        return "Open Sans";
      case CustomTextStyle.subtitle:
        return "Geomanist";
      case CustomTextStyle.title:
        return "Isidora Sans";
      default:
        return "Open Sans";
    }
  }

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
        fontFamily: fontFamily,
      ),
    );
  }
}
