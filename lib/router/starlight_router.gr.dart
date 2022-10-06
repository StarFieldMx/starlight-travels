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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

import '../views/home/home_page.dart' as _i2;
import '../views/main_views.dart' as _i1;
import 'guards/guards.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter({
    _i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StarLightFlowInvited.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowInvited(),
      );
    },
    StarLightFlowUser.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowUser(),
      );
    },
    LayoutSignSelectRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutSignSelect(),
      );
    },
    MainViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    HomeViewInvited.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageView(),
      );
    },
    MyTripsViewInvited.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewInvited(),
      );
    },
    MyProfileViewRouteInvited.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileViewInvited(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    MyTripsView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewUser(),
      );
    },
    MyProfileView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyProfileView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageView(),
      );
    },
    HotelsView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutHotelsView(),
      );
    },
    FlightsView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutFlightsView(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/flow',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          StarLightFlowInvited.name,
          path: '/flow',
          children: [
            _i4.RouteConfig(
              HomeViewInvited.name,
              path: 'home',
              parent: StarLightFlowInvited.name,
            ),
            _i4.RouteConfig(
              MyTripsViewInvited.name,
              path: 'my_trips',
              parent: StarLightFlowInvited.name,
            ),
            _i4.RouteConfig(
              MyProfileViewRouteInvited.name,
              path: 'profile_route',
              parent: StarLightFlowInvited.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          StarLightFlowUser.name,
          path: '/flow_user',
          children: [
            _i4.RouteConfig(
              HomeRoute.name,
              path: 'home_route',
              parent: StarLightFlowUser.name,
              children: [
                _i4.RouteConfig(
                  HomeViewRoute.name,
                  path: '',
                  parent: HomeRoute.name,
                ),
                _i4.RouteConfig(
                  HotelsView.name,
                  path: 'hotels',
                  parent: HomeRoute.name,
                ),
                _i4.RouteConfig(
                  FlightsView.name,
                  path: 'flights',
                  parent: HomeRoute.name,
                ),
              ],
            ),
            _i4.RouteConfig(
              MyTripsView.name,
              path: 'my_trips',
              parent: StarLightFlowUser.name,
            ),
            _i4.RouteConfig(
              MyProfileView.name,
              path: 'profile_route',
              parent: StarLightFlowUser.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        ),
        _i4.RouteConfig(
          MainViewRoute.name,
          path: 'main',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.StarLightFlowInvited]
class StarLightFlowInvited extends _i4.PageRouteInfo<void> {
  const StarLightFlowInvited({List<_i4.PageRouteInfo>? children})
      : super(
          StarLightFlowInvited.name,
          path: '/flow',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowInvited';
}

/// generated route for
/// [_i1.StarLightFlowUser]
class StarLightFlowUser extends _i4.PageRouteInfo<void> {
  const StarLightFlowUser({List<_i4.PageRouteInfo>? children})
      : super(
          StarLightFlowUser.name,
          path: '/flow_user',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowUser';
}

/// generated route for
/// [_i1.LayoutSignSelect]
class LayoutSignSelectRoute extends _i4.PageRouteInfo<void> {
  const LayoutSignSelectRoute()
      : super(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        );

  static const String name = 'LayoutSignSelectRoute';
}

/// generated route for
/// [_i1.MainView]
class MainViewRoute extends _i4.PageRouteInfo<void> {
  const MainViewRoute()
      : super(
          MainViewRoute.name,
          path: 'main',
        );

  static const String name = 'MainViewRoute';
}

/// generated route for
/// [_i2.HomePageView]
class HomeViewInvited extends _i4.PageRouteInfo<void> {
  const HomeViewInvited()
      : super(
          HomeViewInvited.name,
          path: 'home',
        );

  static const String name = 'HomeViewInvited';
}

/// generated route for
/// [_i1.MyTripsViewInvited]
class MyTripsViewInvited extends _i4.PageRouteInfo<void> {
  const MyTripsViewInvited()
      : super(
          MyTripsViewInvited.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewInvited';
}

/// generated route for
/// [_i1.ProfileViewInvited]
class MyProfileViewRouteInvited extends _i4.PageRouteInfo<void> {
  const MyProfileViewRouteInvited()
      : super(
          MyProfileViewRouteInvited.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRouteInvited';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home_route',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.MyTripsViewUser]
class MyTripsView extends _i4.PageRouteInfo<void> {
  const MyTripsView()
      : super(
          MyTripsView.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsView';
}

/// generated route for
/// [_i1.MyProfileView]
class MyProfileView extends _i4.PageRouteInfo<void> {
  const MyProfileView()
      : super(
          MyProfileView.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileView';
}

/// generated route for
/// [_i2.HomePageView]
class HomeViewRoute extends _i4.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i1.LayoutHotelsView]
class HotelsView extends _i4.PageRouteInfo<void> {
  const HotelsView()
      : super(
          HotelsView.name,
          path: 'hotels',
        );

  static const String name = 'HotelsView';
}

/// generated route for
/// [_i1.LayoutFlightsView]
class FlightsView extends _i4.PageRouteInfo<void> {
  const FlightsView()
      : super(
          FlightsView.name,
          path: 'flights',
        );

  static const String name = 'FlightsView';
}
