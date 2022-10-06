import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class LikeHeart extends StatefulWidget {
  const LikeHeart({super.key, this.hotelId});
  final String? hotelId;

  @override
  State<LikeHeart> createState() => _LikeHeartState();
}

class _LikeHeartState extends State<LikeHeart> {
  IconData _icon = Icons.favorite_outline_outlined;
  bool isLiked = false;
  @override
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const double css = 0.1;
    return GestureDetector(
      onTap: () {
        isLiked = !isLiked;

        // ! Add change in database

        _isLiked();
      },
      child: Container(
        width: width * css,
        height: width * css,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: StarLightColors.starPrimaryBlue),
        child: Icon(_icon),
      ),
    );
  }

  void _isLiked() {
    if (isLiked) {
      _icon = Icons.favorite_rounded;
    } else {
      _icon = Icons.favorite_outline_outlined;
    }
    setState(() {});
  }
}
