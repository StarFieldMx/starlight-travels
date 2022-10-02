import 'package:flutter/material.dart';
import 'package:starlight/views/sign_in/widgets/form_sign_in.dart';

class CardSignIn extends StatelessWidget {
  const CardSignIn({
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
          // decoration: BoxDecoration(
          //     color: Colors.white, borderRadius: BorderRadius.circular(15)),
          constraints: BoxConstraints(
            maxHeight: size.height * 0.4,
            maxWidth: size.width * 0.9,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: const FormSignIn(),
        ),
      ],
    );
  }
}
