import 'package:flutter/material.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/utils/image_hotels.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  final HotelsServices hotels;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Stack(
          children: [
            imageHotels(0),
            Text(hotels.hotels[0].hotel),
          ],
        ),
      ),
    );
  }
}
