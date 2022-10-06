import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class DetailsText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? child;
  const DetailsText({super.key, this.title, this.subTitle, this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: width * 0.4,
        // decoration: _buildBoxDecoration(),
        child: child ??
            _TitleSubtitle(
                title: title ?? 'no text', subTitle: subTitle ?? 'no text'),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: StarLightColors.starThirdBlue.withOpacity(0.3),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _TitleSubtitle extends StatelessWidget {
  const _TitleSubtitle({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }
}
