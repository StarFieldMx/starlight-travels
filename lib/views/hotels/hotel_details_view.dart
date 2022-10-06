import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('details view')),
    );
  }
}
