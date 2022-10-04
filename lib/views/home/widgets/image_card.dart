import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (image.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/loading.gif',
        ),
      );
    }
    return Container(
      width: width * 0.9,
      height: width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
    );
  }
}
