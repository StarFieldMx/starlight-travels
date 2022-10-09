import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/views/home/widgets/image_card.dart';

class CardHomeItem extends StatelessWidget {
  const CardHomeItem(
      {super.key,
      required this.title,
      required this.info,
      required this.image});
  final String title;
  final String info;
  final String image;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageCard(
            image: image,
          ),
          Positioned(
            left: 10,
            bottom: 95,
            child: WrapText(
              width: width,
              text: title,
              style: styleTitle(),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: WrapText(
              width: width,
              text: info,
              style: styleInfo(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle styleTitle() =>
      TextStyle(color: StarLightColors.starLight, fontSize: 20);
  TextStyle styleInfo() =>
      TextStyle(color: StarLightColors.starLight, fontSize: 15);
}

class WrapText extends StatelessWidget {
  const WrapText({
    Key? key,
    required this.width,
    required this.text,
    required this.style,
  }) : super(key: key);

  final double width;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    double maxHeight = _getHeight(text.length);
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: width * 0.8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(text, style: style),
          ),
        ],
      ),
    );
  }
}

double _getHeight(int lenght) {
  double value = 0.0;
  if (lenght < 40) {
    value = lenght * 0.6;
  } else if (lenght < 120) {
    value = lenght * 0.9;
  } else {
    value = lenght * 0.5;
  }
  return value;
}
