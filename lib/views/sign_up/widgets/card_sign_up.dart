import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/views/sign_up/provider/signup_provider.dart';
import 'package:starlight/views/sign_up/widgets/form_sign_up.dart';

class CardSignUp extends StatelessWidget {
  const CardSignUp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.6,
            maxWidth: size.width * 0.9,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ChangeNotifierProvider(
              create: (_) => SignUpProvider(), child: const FormSignUp()),
        ),
      ],
    );
  }
}
