import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/my_buys_services.dart';
import 'package:starlight/views/flights/widgets/flights_card.dart';
import 'package:starlight/views/hotels/rooms_items.dart';
import 'package:starlight/widgets/loading_starlight.dart';

class MyTripsViewUser extends StatefulWidget {
  const MyTripsViewUser({super.key});

  @override
  State<MyTripsViewUser> createState() => _MyTripsViewUserState();
}

class _MyTripsViewUserState extends State<MyTripsViewUser> {
  List<Widget> list = [];
  @override
  Widget build(BuildContext context) {
    final myServices = Provider.of<MyBuysServices>(context);
    if (myServices.flights.isEmpty && myServices.rooms.isEmpty) {
      return const Center(
        child: Text("No tienes servicios comprados vamos a comprar algunos!"),
      );
    }
    if (myServices.flights.isNotEmpty || myServices.rooms.isNotEmpty) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            if (myServices.flights.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                    itemCount: myServices.flights.length,
                    itemBuilder: ((context, index) => FlightsCard(
                          flight: myServices.flights[index],
                          isBuying: false,
                        ))),
              ),
            if (myServices.rooms.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 500,
                child: ListView.builder(
                    itemCount: myServices.rooms.length,
                    itemBuilder: ((context, index) => Room(
                          room: myServices.rooms[index],
                          isBuying: false,
                        ))),
              ),
          ],
        ),
      );
    }
    return const LoadinStarlight();
  }
}
