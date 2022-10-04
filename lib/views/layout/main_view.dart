import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 5,
          color: StarLightColors.starLight,
        ),
      ),
    );
  }
}
