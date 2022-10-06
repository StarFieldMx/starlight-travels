import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/providers.dart';

class LikeHeart extends StatelessWidget {
  const LikeHeart({super.key, this.hotelId});
  final String? hotelId;
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    return Container();
  }
}
