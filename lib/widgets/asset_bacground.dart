import 'package:flutter/material.dart';

class AssetBackground extends StatelessWidget {
  const AssetBackground({super.key, this.asset, required this.height});
  final String? asset;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: asset != null
            ? ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                child: _Asset(
                  asset: asset,
                  height: height,
                ),
              )
            : _Asset(
                asset: asset,
                height: height,
              ));
  }
}

class _Asset extends StatelessWidget {
  const _Asset({
    Key? key,
    required this.asset,
    required this.height,
  }) : super(key: key);

  final String? asset;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: Image(
            image: AssetImage(
              asset ?? 'assets/dark_back.jpg',
            ),
            fit: BoxFit.cover));
  }
}
