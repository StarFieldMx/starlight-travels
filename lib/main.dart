import 'package:flutter/material.dart';
// import 'package:starlight/router/guards/guards.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/styles/theme_starlight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _starLightRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final theme = ThemeDataStarLight(context: context);
    return MaterialApp.router(
      theme: theme.starDark,
      routeInformationParser: _starLightRouter.defaultRouteParser(),
      routerDelegate: _starLightRouter.delegate(),
    );
  }
}
