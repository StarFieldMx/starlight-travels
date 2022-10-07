import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/views/hotels/widgets/details.dart';
import 'package:starlight/widgets/background_image.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

import '../../utils/money.dart';

class RoomsItems extends StatelessWidget {
  const RoomsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelServices = Provider.of<HotelsServices>(context);
    hotelServices.rooms;
    final size = MediaQuery.of(context).size;
    return ConstrainedBoxStarlight(
      maxHeight: size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: hotelServices.rooms.length,
              itemBuilder: ((context, index) =>
                  Room(room: hotelServices.rooms[index])),
            ),
          ),
        ],
      ),
    );
  }
}

class Room extends StatelessWidget {
  const Room({super.key, required this.room});
  final Rooms room;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            // width: size.width * 0.9,
            height: size.height * 0.55,
            decoration: BoxDecoration(
                color: StarLightColors.starSecondaryBlue,
                borderRadius: BorderRadius.circular(25)),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                  height: size.width * 0.4,
                  width: size.width,
                  child: BackgroundImage(room.pictures[0]))),
          Positioned(
              bottom: 110,
              left: 15,
              child: SizedBox(
                width: size.width * 0.8,
                height: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(room.type,
                            style: Theme.of(context).textTheme.bodyLarge)),
                  ],
                ),
              )),
          Positioned(
            bottom: 60,
            left: 15,
            child: SizedBox(
                height: size.width * 0.55,
                child: _RoomAmenities(room.roomAmenities)),
          ),
          Positioned(
            bottom: 40,
            left: 15,
            child: Text(
              getCurrency(room.price.toDouble()),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
              bottom: 30,
              right: 15,
              child: SizedBox(
                  height: 40,
                  width: 130,
                  child: PrimaryButton(
                      labelText: "Comprar",
                      onTap: () => context.router.push(PaymentViewRoute())))),
        ],
      ),
    );
  }
}

class _RoomAmenities extends StatelessWidget {
  const _RoomAmenities(this.amenities);
  final RoomAmenities amenities;
  @override
  Widget build(BuildContext context) {
    const int index = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (amenities.internet)
          const ItemAmenties(Icons.wifi, "Internet Gratis"),
        if (amenities.bathroom.toilets) const ItemAmenties(Icons.wc, "Baños"),
        if (amenities.bathroom.shower)
          const ItemAmenties(Icons.bathroom, "Regadera"),
        if (amenities.bathroom.private)
          const ItemAmenties(Icons.bathtub, "Jacuzzi"),
        if (amenities.more[index].housekeeping)
          const ItemAmenties(Icons.cleaning_services, "Servicio de limpieza"),
        if (amenities.more[index].food)
          const ItemAmenties(Icons.local_dining, "Servicio al cuarto"),
        if (amenities.more[index].tvServices)
          const ItemAmenties(Icons.tv, "Televisión por cable"),
        if (amenities.more[index].wine)
          const ItemAmenties(Icons.cleaning_services, "Botella de vino tinto"),
      ],
    );
  }
}
