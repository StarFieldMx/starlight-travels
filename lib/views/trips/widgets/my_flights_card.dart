import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/widgets/widgets.dart';

const mxConvert = 21;

class MyFlightsCard extends StatefulWidget {
  const MyFlightsCard({super.key, required this.flight});
  final Flights flight;

  @override
  State<MyFlightsCard> createState() => _MyFlightsCardState();
}

class _MyFlightsCardState extends State<MyFlightsCard> {
  String _from = "";
  String _to = "";

  @override
  void initState() {
    widget.flight.from.country.then((value) => setState(() {
          _from = "${value.name!}(${value.code})";
        }));
    widget.flight.to.country.then((value) => setState(() {
          _to = "${value.name!}(${value.code})";
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 150,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const BackgroundImage(
                'https://anba.com.br/wp-content/uploads/2020/07/emiratesboeing777-300er.png'),
            DetailsText(
              title: _from,
              subTitle: _to,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: PriceTag(
                  price: widget.flight.price.toDouble() * mxConvert,
                  typeTrip: widget.flight.type.name,
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
