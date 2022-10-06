import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/utils/parse_time.dart';
import 'package:starlight/widgets/multiply_text.dart';
import 'package:starlight/widgets/widgets.dart';

const mxConvert = 21;

class MyFlightsCard extends StatelessWidget {
  const MyFlightsCard({super.key, required this.flight});
  final Flights flight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // ! Margi in view!!!
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        width: double.infinity,
        height: 150,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const AssetBackground(),
            DetailsText(
              child: MultiplyText(
                textList: [
                  {"time": "${flight.depTime}-${flight.arrTime}"},
                  "${flight.from.name}(${flight.from.code})",
                  "${flight.to.name}(${flight.to.code})",
                  parseTime(flight.flighTime),
                  flight.airline,
                ],
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: PriceTag(
                  price: flight.price.toDouble() * mxConvert,
                  typeTrip: flight.type.name,
                )),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}
