import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/utils/image_hotels.dart';
import 'package:starlight/widgets/loading_starlight.dart';

class LayoutHotelsView extends StatelessWidget {
  const LayoutHotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = Provider.of<HotelsServices>(context);
    hotels.context;
    if (hotels.isLoading) return const LoadinStarlight();
    if (hotels.hotels.isEmpty) {
      return const Center(
        child: Text('No Data'),
      );
    }
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
