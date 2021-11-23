import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:transparencia_gov_ce/routes.dart';

void main() {
  runApp(const AppTransparencia());
}

class AppTransparencia extends StatelessWidget {
  const AppTransparencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Transparencia',
      initialRoute: '/login',
      routes: appRoutes(context),
    );
  }
}
