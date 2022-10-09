import 'package:flutter/material.dart';
import 'package:starlight/views/hotels/rooms_items.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key, required this.hotelName});
  final String hotelName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RoomList(
        hotelName: hotelName,
      ),
    );
  }
}
