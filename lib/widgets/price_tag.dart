import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class PriceTag extends StatelessWidget {
  final double price;

  final String? typeTrip;
  const PriceTag({
    super.key,
    required this.price,
    this.typeTrip = '',
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.3,
      height: width * 0.15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: StarLightColors.starThirdBlue.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text('MXN\$$price',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                if (typeTrip != null)
                  Text("Vuelo ${typeTrip!}",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            )),
      ),
    );
  }
}
