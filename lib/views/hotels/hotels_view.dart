import 'package:flutter/material.dart';
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
              return GestureDetector(
                onTap: () => print('hola'),
                child: HotelItem(
                  hotel: hotels.hotels[index],
                  imageIndexHotel: index,
                ),
              );
            },
          )),
    );
  }
}
