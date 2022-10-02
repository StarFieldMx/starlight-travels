import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class LayoutHomeView extends StatelessWidget {
  const LayoutHomeView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final upperTab = [
      GestureDetector(
        child: const Icon(Icons.hotel, size: 25),
        onTap: () {},
      ),
      GestureDetector(
        child: const Icon(Icons.flight_land_rounded, size: 25),
        onTap: () {},
      ),
      GestureDetector(
        child: const Icon(Icons.today_rounded, size: 25),
        onTap: () {},
      ),
    ];
    return Scaffold(
      backgroundColor: StarLightColors.starPrimaryBlue,
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(upperTab),
          SliverSafeArea(
              sliver: SliverList(delegate: SliverChildListDelegate([child])))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final List<GestureDetector> list;

  const _CustomAppBar(this.list);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: StarLightColors.starSecondaryBlue,
      expandedHeight: width * 0.13,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: StarLightColors.starLight,
                  spreadRadius: 1,
                  offset: Offset(0, width * 0.224),
                )
              ],
            ),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              // ? Space of the ICONS in the appbar
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: list,
            )),
      ),
    );
  }
}
