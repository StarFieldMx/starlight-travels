import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/views/layout/bottomNavigate/bottom_navigator.dart';

class StarLightFlowUser extends StatelessWidget {
  const StarLightFlowUser({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return AutoTabsScaffold(
      bottomNavigationBuilder: starLightBottomNav,
      routes: _pageRoutes(),
    );
  }
}

List<PageRouteInfo<dynamic>> _pageRoutes() {
  return const [
    HomeRoute(),
    MyTripsView(),
    MyProfileView(),
  ];
}
