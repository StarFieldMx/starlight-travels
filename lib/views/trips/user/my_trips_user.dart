import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/services/flights_services.dart';
import 'package:starlight/views/trips/widgets/my_flights_card.dart';
import 'package:starlight/widgets/loading_starlight.dart';

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
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: _parseChildren(provider.flights),
          ),
        ),
      );
    }
    return const LoadinStarlight();
  }

  List<Widget> _parseChildren(List<Flights> flights) => flights
      .map((f) => MyFlightsCard(
            flight: f,
          ))
      .toList();
}
