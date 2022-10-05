import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/services/flights_services.dart';
import 'package:starlight/views/payment/payment_screen.dart';
import 'package:starlight/views/trips/widgets/my_flights_card.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class MyTripsViewUser extends StatefulWidget {
  const MyTripsViewUser({super.key});

  @override
  State<MyTripsViewUser> createState() => _MyTripsViewUserState();
}

class _MyTripsViewUserState extends State<MyTripsViewUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightsServices>(context);
    if (provider.flights.isNotEmpty) {
      Flights flight = provider.flights[0];
      return SafeArea(
        child: Column(
          children: [
            MyFlightsCard(
              flight: flight,
            ),
            MyFlightsCard(
              flight: flight,
            )
          ],
        ),
      );
    }
    return Center();
  }
}
