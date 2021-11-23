import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';
import 'package:transparencia_gov_ce/widgets/typography.dart';

class NotFoundRoute extends StatelessWidget {
  const NotFoundRoute({
    Key? key,
  }) : super(key: key);

  void redirecting(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    redirecting(context);

    return Scaffold(
      backgroundColor: MaterialColors.bgColorScreen,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SimpleText(
                "Ops!",
                textAlign: TextAlign.center,
                textSize: 32.0,
              ),
              SimpleText(
                "Ocorreu algum erro",
                textAlign: TextAlign.center,
                textSize: 32.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SimpleText(
                  "Desculpe o incômodo!",
                  textAlign: TextAlign.center,
                ),
              ),
              SimpleText(
                "Você será redirecionado para o Início",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
