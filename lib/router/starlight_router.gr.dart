// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

import '../views/home/home_page.dart' as _i2;
import '../views/layout/starlight_flow.dart' as _i1;
import '../views/main_views.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StarLightFlow.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlow(),
      );
    },
    HomeView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageView(),
      );
    },
    MyTripsView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MyTripsView(),
      );
    },
    MyProfileViewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    MyProfileView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileView(),
      );
    },
    LayoutSignSelectRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LayoutSignSelect(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/flow',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          StarLightFlow.name,
          path: '/flow',
          children: [
            _i5.RouteConfig(
              HomeView.name,
              path: 'home',
              parent: StarLightFlow.name,
            ),
            _i5.RouteConfig(
              MyTripsView.name,
              path: 'my_trips',
              parent: StarLightFlow.name,
            ),
            _i5.RouteConfig(
              MyProfileViewRoute.name,
              path: 'profile_route',
              parent: StarLightFlow.name,
              children: [
                _i5.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: MyProfileViewRoute.name,
                  redirectTo: 'profile',
                  fullMatch: true,
                ),
                _i5.RouteConfig(
                  MyProfileView.name,
                  path: 'profile',
                  parent: MyProfileViewRoute.name,
                ),
                _i5.RouteConfig(
                  LayoutSignSelectRoute.name,
                  path: 'sign_in',
                  parent: MyProfileViewRoute.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.StarLightFlow]
class StarLightFlow extends _i5.PageRouteInfo<void> {
  const StarLightFlow({List<_i5.PageRouteInfo>? children})
      : super(
          StarLightFlow.name,
          path: '/flow',
          initialChildren: children,
        );

  static const String name = 'StarLightFlow';
}

/// generated route for
/// [_i2.HomePageView]
class HomeView extends _i5.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: 'home',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.MyTripsView]
class MyTripsView extends _i5.PageRouteInfo<void> {
  const MyTripsView()
      : super(
          MyTripsView.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsView';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class MyProfileViewRoute extends _i5.PageRouteInfo<void> {
  const MyProfileViewRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MyProfileViewRoute.name,
          path: 'profile_route',
          initialChildren: children,
        );

  static const String name = 'MyProfileViewRoute';
}

/// generated route for
/// [_i3.ProfileView]
class MyProfileView extends _i5.PageRouteInfo<void> {
  const MyProfileView()
      : super(
          MyProfileView.name,
          path: 'profile',
        );

  static const String name = 'MyProfileView';
}

/// generated route for
/// [_i3.LayoutSignSelect]
class LayoutSignSelectRoute extends _i5.PageRouteInfo<void> {
  const LayoutSignSelectRoute()
      : super(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        );

  static const String name = 'LayoutSignSelectRoute';
}
