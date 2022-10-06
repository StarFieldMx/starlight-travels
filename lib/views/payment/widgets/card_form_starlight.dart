import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CardFormStarlight extends StatelessWidget {
  const CardFormStarlight({super.key, required this.controller});
  final CardFormEditController controller;
  @override
  Widget build(BuildContext context) {
    // ! adapt to recieve info from somewhere?
    return CardFormField(
      controller: controller,
      // ! Sett style cardform
      style: CardFormStyle(),
    );
  }
}
