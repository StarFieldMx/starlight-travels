import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Widget starLightBottomNav(BuildContext _, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    currentIndex: tabsRouter.activeIndex,
    onTap: tabsRouter.setActiveIndex,
    items: const [
      BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.home)),
      BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.chat_bubble)),
      BottomNavigationBarItem(
          label: 'Settings', icon: Icon(Icons.verified_user_outlined)),
    ],
  );
}
