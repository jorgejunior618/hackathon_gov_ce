import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/screens/home/home.dart';

Map<String, WidgetBuilder> appRoutes(BuildContext context) {
  return <String, WidgetBuilder>{
    '/home': (context) => const Home(),
    // '*': (context) => const NotFoundRoute(),
  };
}
