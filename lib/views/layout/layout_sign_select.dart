import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/views/main_views.dart';
import 'package:starlight/views/sign_in/layout_sign_in.dart';

class LayoutSignSelect extends StatefulWidget {
  const LayoutSignSelect({Key? key}) : super(key: key);
  // final TabBar upperTab;
  @override
  State<LayoutSignSelect> createState() => _LayoutSignSelectState();
}

class _LayoutSignSelectState extends State<LayoutSignSelect> {
  bool isSignIn = true;
  void _changeView(int value) {
    if (value == 0) context.router.pop();
    if (value == 1 && isSignIn) return;
    if (value == 2 && !isSignIn) return;
    isSignIn = !isSignIn;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final upperTab = TabBar(
      tabs: const <Tab>[
        Tab(icon: Icon(Icons.arrow_back)),
        Tab(icon: Text("Iniciar sesión")),
        Tab(icon: Text("Crear cuenta")),
        // Tab(icon: Icon(Icons.arrow_back)),
      ],
      onTap: (int value) => _changeView(value),
    );
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: upperTab,
          toolbarHeight: 0,
        ),
        backgroundColor: StarLightColors.starPrimaryBlue,
        body: isSignIn ? const LayoutSignIn() : const LayoutSignUp(),
      ),
    );
  }
}
