import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/flights_services.dart';
import 'package:starlight/views/trips/widgets/my_flights_card.dart';
import 'package:starlight/widgets/loading_starlight.dart';

class LayoutFlightsView extends StatelessWidget {
  const LayoutFlightsView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightsServices>(context);
    if (provider.flights.isNotEmpty && !provider.isLoading) {
      return SafeArea(
        child: ListView.builder(
          itemCount: provider.flights.length,
          itemBuilder: (_, int item) {
            return MyFlightsCard(
              flight: provider.flights[item],
            );
          },
        ),
      );
    }
    return const LoadinStarlight();
  }
}
