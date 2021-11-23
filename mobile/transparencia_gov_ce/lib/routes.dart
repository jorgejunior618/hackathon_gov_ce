import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/screens/home.dart';

// import 'package:trasparencia_gov_ce/Components/transacoes_lista/transacoes_lista.dart';

Map<String, WidgetBuilder> appRoutes(BuildContext context) {
  return <String, WidgetBuilder>{
    '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
  };
}
