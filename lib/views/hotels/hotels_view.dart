import 'package:flutter/material.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/utils/image_hotels.dart';
import 'package:starlight/widgets/check_status_provider.dart';

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
              return _HoteItem(
                hotels: hotels,
                index: index,
              );
            },
          )),
    );
  }
}

class _HoteItem extends StatelessWidget {
  const _HoteItem({
    Key? key,
    required this.hotels,
    required this.index,
  }) : super(key: key);

  final HotelsServices hotels;
  final int index;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Hotel = hotels.hotels[index];
    return Container(
      height: height * 0.3,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          imageHotels(index),
          Text(hotels.hotels[index].hotel),
        ],
      ),
    );
  }
}
