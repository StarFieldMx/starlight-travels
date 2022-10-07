import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:starlight/services/notification_service.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class CardFormStarlight extends StatefulWidget {
  const CardFormStarlight({super.key});

  @override
  State<CardFormStarlight> createState() => _CardFormStarlightState();
}

class _CardFormStarlightState extends State<CardFormStarlight> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    // ! adapt to recieve info from somewhere?
    return Center(
      child: Column(
        children: [
          CardFormField(
            onCardChanged: (CardFieldInputDetails? card) {
              isComplete = card?.complete ?? false;
            },
            // ! Sett style cardform
            style: CardFormStyle(),
          ),
          PrimaryButton(
              labelText: "Pagar",
              onTap: () {
                if (isComplete) {
                  // ! PAGAR
                } else {
                  NotificationsService.showSnackbar(
                      "Todos los datos de pago son necesarios");
                }
              })
        ],
      ),
    );
  }
}
