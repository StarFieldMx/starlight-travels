import 'package:flutter/material.dart';

class AssetBackground extends StatelessWidget {
  const AssetBackground({super.key, this.asset});
  final String? asset;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: asset != null
            ? ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                child: _Asset(asset: asset),
              )
            : _Asset(asset: asset));
  }
}

class _Asset extends StatelessWidget {
  const _Asset({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String? asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 400,
        child: Image(
            image: AssetImage(
              asset ?? 'assets/dark_back.jpg',
            ),
            fit: BoxFit.cover));
  }
}
