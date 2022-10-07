// main.dart
import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/views/payment/widgets/card_form_starlight.dart';

// payment_screen.dart
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, this.hotel, this.flight});
  final Hotel? hotel;
  final Flight? flight;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Pago",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: const CardFormStarlight(),
      ),
    );
  }
}

_parseChildren() {}
