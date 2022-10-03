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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../views/home/home_page.dart' as _i2;
import '../views/main_views.dart' as _i1;
import 'guards/guards.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter({
    _i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i5.AuthGuard authGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    StarLightFlowInvited.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowInvited(),
      );
    },
    StarLightFlowUser.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowUser(),
      );
    },
    LayoutSignSelectRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutSignSelect(),
      );
    },
    MainViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    HomeViewInvited.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageView(),
      );
    },
    MyTripsViewInvited.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewInvited(),
      );
    },
    MyProfileViewRouteInvited.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileViewInvited(),
      );
    },
    HomeView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageView(),
      );
    },
    MyTripsView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewUser(),
      );
    },
    MyProfileView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyProfileView(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/flow',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          StarLightFlowInvited.name,
          path: '/flow',
          children: [
            _i3.RouteConfig(
              HomeViewInvited.name,
              path: 'home',
              parent: StarLightFlowInvited.name,
            ),
            _i3.RouteConfig(
              MyTripsViewInvited.name,
              path: 'my_trips',
              parent: StarLightFlowInvited.name,
            ),
            _i3.RouteConfig(
              MyProfileViewRouteInvited.name,
              path: 'profile_route',
              parent: StarLightFlowInvited.name,
            ),
          ],
        ),
        _i3.RouteConfig(
          StarLightFlowUser.name,
          path: '/flow_user',
          children: [
            _i3.RouteConfig(
              HomeView.name,
              path: 'home',
              parent: StarLightFlowUser.name,
            ),
            _i3.RouteConfig(
              MyTripsView.name,
              path: 'my_trips',
              parent: StarLightFlowUser.name,
            ),
            _i3.RouteConfig(
              MyProfileView.name,
              path: 'profile_route',
              parent: StarLightFlowUser.name,
            ),
          ],
        ),
        _i3.RouteConfig(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        ),
        _i3.RouteConfig(
          MainViewRoute.name,
          path: 'main',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.StarLightFlowInvited]
class StarLightFlowInvited extends _i3.PageRouteInfo<void> {
  const StarLightFlowInvited({List<_i3.PageRouteInfo>? children})
      : super(
          StarLightFlowInvited.name,
          path: '/flow',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowInvited';
}

/// generated route for
/// [_i1.StarLightFlowUser]
class StarLightFlowUser extends _i3.PageRouteInfo<void> {
  const StarLightFlowUser({List<_i3.PageRouteInfo>? children})
      : super(
          StarLightFlowUser.name,
          path: '/flow_user',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowUser';
}

/// generated route for
/// [_i1.LayoutSignSelect]
class LayoutSignSelectRoute extends _i3.PageRouteInfo<void> {
  const LayoutSignSelectRoute()
      : super(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        );

  static const String name = 'LayoutSignSelectRoute';
}

/// generated route for
/// [_i1.MainView]
class MainViewRoute extends _i3.PageRouteInfo<void> {
  const MainViewRoute()
      : super(
          MainViewRoute.name,
          path: 'main',
        );

  static const String name = 'MainViewRoute';
}

/// generated route for
/// [_i2.HomePageView]
class HomeViewInvited extends _i3.PageRouteInfo<void> {
  const HomeViewInvited()
      : super(
          HomeViewInvited.name,
          path: 'home',
        );

  static const String name = 'HomeViewInvited';
}

/// generated route for
/// [_i1.MyTripsViewInvited]
class MyTripsViewInvited extends _i3.PageRouteInfo<void> {
  const MyTripsViewInvited()
      : super(
          MyTripsViewInvited.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewInvited';
}

/// generated route for
/// [_i1.ProfileViewInvited]
class MyProfileViewRouteInvited extends _i3.PageRouteInfo<void> {
  const MyProfileViewRouteInvited()
      : super(
          MyProfileViewRouteInvited.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRouteInvited';
}

/// generated route for
/// [_i2.HomePageView]
class HomeView extends _i3.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: 'home',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i1.MyTripsViewUser]
class MyTripsView extends _i3.PageRouteInfo<void> {
  const MyTripsView()
      : super(
          MyTripsView.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsView';
}

/// generated route for
/// [_i1.MyProfileView]
class MyProfileView extends _i3.PageRouteInfo<void> {
  const MyProfileView()
      : super(
          MyProfileView.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileView';
}
