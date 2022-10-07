import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/widgets/check_status_provider.dart';

import 'widgets/card_hotels.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  final HotelsServices hotels;

  @override
  Widget build(BuildContext context) {
    return CheckStatusProvider(
      isEmpty: hotels.hotels.isEmpty,
      isLoading: hotels.isLoading,
      emptyMessage: 'No se encontraron hoteles',
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: hotels.hotels.length,
            itemBuilder: (_, int index) {
              final hotel = hotels.hotels[index];
              return GestureDetector(
                onTap: () =>
                    context.router.push(HotelDetailsViewRoute(hotel: hotel)),
                child: HotelItem(
                  hotel: hotel,
                  imageIndexHotel: index,
                ),
              );
            },
          )),
    );
  }
}
