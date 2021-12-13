import 'package:flutter/material.dart';
import 'package:transparencia_gov_ce/screens/em_construcao/em_construcao.dart';
import 'package:transparencia_gov_ce/screens/home/home.dart';
import 'package:transparencia_gov_ce/screens/servidores_publicos/gasto_mensal/gasto_mensal.dart';
import 'package:transparencia_gov_ce/screens/servidores_publicos/servidores_publicos.dart';

Map<String, WidgetBuilder> appRoutes(BuildContext context) {
  return <String, WidgetBuilder>{
    '/home': (context) => const Home(),
    '/emConstrucao': (context) => const EmConstrucao(),
    '/servidoresPublicos': (context) => const ServidoresPublicos(),
    '/gastoMensal': (context) => const GastosMensaisServidores(),
  };
}
