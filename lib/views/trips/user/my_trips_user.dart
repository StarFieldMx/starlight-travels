import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/flights.dart';
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
    final myServices = Provider.of<MyServices>(context);
    if (myServices.flights.isEmpty && myServices.rooms.isEmpty) {
      return const Center(
        child: Text("No tienes servicios comprados vamos a comprar algunos!"),
      );
    }
    if (myServices.flights.isNotEmpty || myServices.rooms.isNotEmpty) {
      if (myServices.flights.isNotEmpty || myServices.rooms.isNotEmpty) {
        return ListView.builder(
          itemCount: myServices.myServices.length,
          itemBuilder: ((context, index) {
            if (myServices.myServices[index] is Flight) {
              return Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlightsCard(
                    flight: myServices.myServices[index],
                    isBuying: false,
                  ),
                ],
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoomItem(
                  room: myServices.myServices[index],
                  isBuying: false,
                ),
              ],
            );
          }),
        );
      }
    }
    return const LoadinStarlight();
  }
}
