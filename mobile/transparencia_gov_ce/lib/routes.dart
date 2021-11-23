import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/screens/home.dart';
import 'package:transparencia_gov_ce/screens/routing_problem.dart';

Map<String, WidgetBuilder> appRoutes(BuildContext context) {
  return <String, WidgetBuilder>{
    '/home': (context) => const MyHomePage(),
    // '*': (context) => const NotFoundRoute(),
  };
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyHomePage());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const NotFoundRoute();
          },
        );
    }
  }
}
