import 'package:flutter/material.dart';

class AssetBackground extends StatelessWidget {
  const AssetBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const SizedBox(
          width: double.infinity,
          height: 400,
          child: Image(
              image: AssetImage(
                'assets/dark_back.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }
}
