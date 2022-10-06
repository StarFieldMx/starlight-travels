import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';

class FlightDetailsView extends StatelessWidget {
  const FlightDetailsView({super.key, required this.flight});
  final Flight flight;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('details_flights'),
      ),
    );
  }
}
