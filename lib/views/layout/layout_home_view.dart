import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/styles/starlight_colors.dart';

class LayoutHomeView extends StatefulWidget {
  const LayoutHomeView({super.key, required this.child});
  final Widget child;

  @override
  State<LayoutHomeView> createState() => _LayoutHomeViewState();
}

class _LayoutHomeViewState extends State<LayoutHomeView>
    with AfterLayoutMixin<LayoutHomeView> {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    bool hasUser = userState.user == null ? false : true;
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
          if (hasUser) _CustomAppBar(upperTab),
          SliverSafeArea(
              sliver:
                  SliverList(delegate: SliverChildListDelegate([widget.child])))
        ],
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final userState = Provider.of<UserState>(context, listen: false);
    userState.context ??= context;
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
