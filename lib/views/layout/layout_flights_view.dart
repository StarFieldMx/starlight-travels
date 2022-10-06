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
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vuelos disponibles'),
        ),
        body: FlightView(provider: provider),
      );
    }
    return const LoadinStarlight();
  }
}

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
          return MyFlightsCard(
            flight: provider.flights[item],
          );
        },
      ),
    );
  }
}
