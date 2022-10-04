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
      TextStyle(color: StarLightColors.starLight, fontSize: 30);
  TextStyle styleInfo() =>
      TextStyle(color: StarLightColors.starLight, fontSize: 18);
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
    double maxHeight = text.length > 40 ? 80 : 40;
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: width * 0.9,
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
