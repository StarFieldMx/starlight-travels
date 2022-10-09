import 'package:flutter/material.dart';
import 'package:starlight/services/flights_services.dart';

import 'widgets/flights_card.dart';

class FlightView extends StatelessWidget {
  const FlightView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final FlightsServices provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: provider.flights.length,
        itemBuilder: (_, int item) {
          return FlightsCard(
            flight: provider.flights[item],
          );
        },
      ),
    );
  }
}
