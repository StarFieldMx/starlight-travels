import 'package:flutter/material.dart';
import 'package:starlight/widgets/widgets.dart';

Widget imageHotels(int item, double height) {
  return AssetBackground(
    asset: "assets/hotel$item.jpg",
    height: height,
  );
}
