import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/flights_services.dart';
import 'package:starlight/views/flights/flights_view.dart';
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
