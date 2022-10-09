import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/utils/image_hotels.dart';
import 'package:starlight/utils/money.dart';

import 'like_heart.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({
    Key? key,
    required this.hotel,
    required this.imageIndexHotel,
  }) : super(key: key);

  final Hotel hotel;
  final int imageIndexHotel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightBack = size.height * 0.3;
    final heightImage = heightBack * 0.6;

    return Container(
      height: heightBack,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: size.width,
              height: heightBack,
              color: StarLightColors.starLightLowPurple,
            ),
            Positioned(
              top: 0,
              child: ImageHotel(
                heightImage: heightImage,
                size: size,
                index: imageIndexHotel,
                name: hotel.name,
              ),
            ), // Height 400
            Positioned(
              bottom: 0,
              left: 0,
              child: _BottomDetails(
                size: size,
                heightBack: heightBack,
                hotel: hotel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomDetails extends StatelessWidget {
  const _BottomDetails({
    Key? key,
    required this.size,
    required this.heightBack,
    required this.hotel,
  }) : super(key: key);
  final Hotel hotel;
  final Size size;
  final double heightBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: heightBack * 0.4,
      decoration: BoxDecoration(
        color: StarLightColors.starSecondaryBlue,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          // ? Left side
          Positioned(
            top: 15,
            left: 20,
            child: Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: StarLightColors.starThirdBlue,
                ),
                Text("${hotel.rate.toString()}/5"),
              ],
            ),
          ),
          const Positioned(
            top: 50,
            left: 20,
            child: Text("Totalmente reembolsable"),
          ),
          const Positioned(
            top: 70,
            left: 20,
            child: Text("Reserva hoy paga después"),
          ),
          Positioned(
            top: 15,
            right: 40,
            child: Text(
              getCurrency(hotel.price),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
    );
  } //
}

class ImageHotel extends StatelessWidget {
  const ImageHotel({
    Key? key,
    required this.heightImage,
    required this.size,
    required this.index,
    required this.name,
  }) : super(key: key);

  final double heightImage;
  final Size size;
  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: heightImage,
          maxWidth: size.width,
          minHeight: heightImage * 0.8,
          minWidth: size.width * 0.8,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            imageHotels(index, heightImage),
            const Positioned(
              top: 15,
              right: 25,
              child: LikeHeart(),
            ),
            Positioned(
              bottom: 20,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gran hotel $name",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Zona Hotelera'),
                ],
              ),
            ),
          ],
        ));
  }
}
