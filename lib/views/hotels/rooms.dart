import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/hotels_services.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelServices = Provider.of<HotelsServices>(context);
    hotelServices.rooms;
    return Container();
  }
}
