import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/my_buys_services.dart';
import 'package:starlight/services/notification_service.dart';
import 'package:starlight/utils/money.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class CardFormStarlight extends StatefulWidget {
  const CardFormStarlight({super.key, this.room, this.flight});
  final Rooms? room;
  final Flight? flight;
  @override
  State<CardFormStarlight> createState() => _CardFormStarlightState();
}

class _CardFormStarlightState extends State<CardFormStarlight> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    // ! adapt to recieve info from somewhere?
    final userState = Provider.of<UserState>(context);
    final buyServices = Provider.of<MyServices>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          if (widget.flight != null)
            Container(
              margin: const EdgeInsets.only(left: 15),
              width: double.infinity,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    enabled: false,
                    initialValue: userState.user?.displayName ?? '',
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.flight?.from.code,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.flight?.to.code,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: getCurrency(widget.flight!.price.toDouble()),
                  ),
                ],
              ),
            ),
          if (widget.room != null)
            Container(
              margin: const EdgeInsets.only(left: 15),
              width: double.infinity,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    enabled: false,
                    initialValue: widget.room?.type,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: getCurrency(widget.room!.price.toDouble()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Camas"),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.room!.beds[0].type,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.room!.beds[0].amount.toString(),
                  ),
                ],
              ),
            ),
          CardFormField(
            onCardChanged: (CardFieldInputDetails? card) {
              isComplete = card?.complete ?? false;
              setState(() {});
            },
            // ! Sett style cardform
            style: CardFormStyle(),
          ),
          PrimaryButton(
              labelText: "Pagar",
              onTap: () {
                if (isComplete) {
                  if (widget.flight != null) {
                    buyServices.buyFlight(widget.flight!, context);
                  } else if (widget.room != null) {
                    buyServices.buyRoom(widget.room!, context);
                  }
                  print("funca");
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
