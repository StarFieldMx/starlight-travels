import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CardFormStarlight extends StatelessWidget {
  const CardFormStarlight({super.key});
  // final CardFormEditController controller;
  @override
  Widget build(BuildContext context) {
    // ! adapt to recieve info from somewhere?
    return Column(
      children: [
        CardFormField(
          onCardChanged: (CardFieldInputDetails? card) {},
          // ! Sett style cardform
          style: CardFormStyle(),
        ),
      ],
    );
  }
}
