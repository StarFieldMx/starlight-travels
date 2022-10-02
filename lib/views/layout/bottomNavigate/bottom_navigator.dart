import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Widget starLightBottomNav(BuildContext _, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    currentIndex: tabsRouter.activeIndex,
    onTap: tabsRouter.setActiveIndex,
    items: const [
      BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
      BottomNavigationBarItem(
          label: 'Viajes', icon: Icon(Icons.airplanemode_active_rounded)),
      BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person_pin)),
    ],
  );
}
