import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/views/hotels/widgets/card_hotels.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

import '../../widgets/widgets.dart';
import 'widgets/details.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key, required this.hotel, required this.index});
  final Hotel hotel;
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverAppBar(
              expandedHeight: size.height * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                background: ImageHotel(
                  heightImage: size.height * 0.2,
                  size: size,
                  index: index,
                  name: hotel.name,
                ), //,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 20),
              ConstrainedBoxStarlight(
                maxHeight: size.height * 0.12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Gran hotel ${hotel.name}",
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    RatingBarIndicator(
                      rating: hotel.rate,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: size.width * 0.055,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
              ConstrainedBoxStarlight(
                maxHeight: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(parseRate(hotel.rate), style: bigSubtitle()),
                    ),
                  ],
                ),
              ),
              if (hotel.amenties.listAmenties.isNotEmpty)
                ConstrainedBoxStarlight(
                  maxHeight: size.height * 0.3,
                  child: Amenities(hotel: hotel),
                ),
              Details(size: size, hotel: hotel),
              PrimaryButton(
                labelText: "Seleccionar cuarto",
                onTap: () => context.router.pushNamed("rooms"),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
          // SliverList(delegate: SliverChildListDelegate(buildListRooms(context)))
        ],
      ),
    );
  }

  String parseRate(double rate) {
    if (rate < 3) {
      return '$rate/5 Regular';
    } else if (rate > 3 && rate < 4) {
      return '$rate/5 Maravillate con esto';
    } else if (rate > 4 && rate < 5) {
      return '$rate/5 Cielos que macizo ';
    }
    return '$rate/5 La perfección puede ser letal ';
  }

  TextStyle bigSubtitle() =>
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
}
