import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = const Text(''),
    this.backgroundColor = Colors.blue,
    this.backButtom = false,
  }) : super(key: key);

  final Widget title;
  final Color backgroundColor;
  final bool backButtom;

  final double _prefferedHeight = 180.0;

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: MediaQuery.of(context).padding.top + 5,
        bottom: 5,
      ),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: backButtom
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (backButtom)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back,
                    size: 24.0,
                    color: MaterialColors.white,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: title,
          ),
          if (backButtom)
            const SizedBox(
              width: 44.0,
              height: 0.0,
            ),
        ],
      ),
    );
  }
}
