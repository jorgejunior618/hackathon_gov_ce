import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.title = "",
    this.disabled = false,

    /// Default = top = 8
    this.margin = const EdgeInsets.only(top: 8.0),
    this.padding = const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
    required this.onTap,
    this.allScreen = false,
    this.withBackground = true,
    this.icon,
    this.width,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final bool disabled;

  /// Set this field [True] if it should to
  /// occoup all the Container Horizontal Space
  final bool allScreen;
  final bool withBackground;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Icon? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: allScreen ? double.infinity : width,
      child: Material(
        color: disabled
            ? withBackground
                ? MaterialColors.muted
                : Colors.transparent
            : withBackground
                ? MaterialColors.primary
                : Colors.transparent,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          highlightColor: Colors.white.withOpacity(0.2),
          splashColor: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.0),
          onTap: disabled ? () {} : onTap,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: TextStyle(
                      color: withBackground
                          ? Colors.white
                          : MaterialColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                if (icon != null && title.isNotEmpty) Container(width: 8.0),
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.all(0.0),
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

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    this.icon = const Icon(Icons.search),
    required this.onTap,
  }) : super(key: key);

  final Icon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: Colors.white,
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.4),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black,
              width: 0.8,
            ),
          ),
          height: 50,
          width: 50,
          child: icon,
        ),
      ),
    );
  }
}

class EditButtonStyled extends StatelessWidget {
  const EditButtonStyled({
    Key? key,
    this.textColor = MaterialColors.muted,
  }) : super(key: key);

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Editar',
          style: TextStyle(
            fontSize: 14.0,
            // fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(
            Icons.edit,
            color: textColor,
            size: 16,
          ),
        ),
      ],
    );
  }
}

class EmailFloatingButton extends StatelessWidget {
  const EmailFloatingButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Enviar por e-mail',
      onPressed: onTap,
      child: const Icon(Icons.mail_outline),
    );
  }
}
