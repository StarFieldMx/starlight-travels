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
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i5;

import '../views/home/home_page.dart' as _i3;
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
    ServicesViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeViewInvitedRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePageView(),
      );
    },
    MyTripsViewInvitedRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewInvited(),
      );
    },
    MyProfileViewRouteInvitedRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileViewInvited(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePageView(),
      );
    },
    MyTripsViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewUser(),
      );
    },
    MyProfileViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyProfileView(),
      );
    },
    HotelsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FlightsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HotelsViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutHotelsView(),
      );
    },
    HotelDetailsViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HotelDetailsView(),
      );
    },
    FlightsViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutFlightsView(),
      );
    },
    FlightDetailsViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FlightDetailsView(),
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
              HomeViewInvitedRoute.name,
              path: 'home',
              parent: StarLightFlowInvited.name,
            ),
            _i4.RouteConfig(
              MyTripsViewInvitedRoute.name,
              path: 'my_trips',
              parent: StarLightFlowInvited.name,
            ),
            _i4.RouteConfig(
              MyProfileViewRouteInvitedRoute.name,
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
            ),
            _i4.RouteConfig(
              MyTripsViewRoute.name,
              path: 'my_trips',
              parent: StarLightFlowUser.name,
            ),
            _i4.RouteConfig(
              MyProfileViewRoute.name,
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
        _i4.RouteConfig(
          ServicesViewRoute.name,
          path: 'services',
          children: [
            _i4.RouteConfig(
              HotelsRoute.name,
              path: 'hotels',
              parent: ServicesViewRoute.name,
              children: [
                _i4.RouteConfig(
                  HotelsViewRoute.name,
                  path: '',
                  parent: HotelsRoute.name,
                ),
                _i4.RouteConfig(
                  HotelDetailsViewRoute.name,
                  path: 'hotel_details',
                  parent: HotelsRoute.name,
                ),
              ],
            ),
            _i4.RouteConfig(
              FlightsRoute.name,
              path: 'flights',
              parent: ServicesViewRoute.name,
              children: [
                _i4.RouteConfig(
                  FlightsViewRoute.name,
                  path: '',
                  parent: FlightsRoute.name,
                ),
                _i4.RouteConfig(
                  FlightDetailsViewRoute.name,
                  path: 'hotel_details',
                  parent: FlightsRoute.name,
                ),
              ],
            ),
          ],
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
/// [_i2.EmptyRouterPage]
class ServicesViewRoute extends _i4.PageRouteInfo<void> {
  const ServicesViewRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ServicesViewRoute.name,
          path: 'services',
          initialChildren: children,
        );

  static const String name = 'ServicesViewRoute';
}

/// generated route for
/// [_i3.HomePageView]
class HomeViewInvitedRoute extends _i4.PageRouteInfo<void> {
  const HomeViewInvitedRoute()
      : super(
          HomeViewInvitedRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewInvitedRoute';
}

/// generated route for
/// [_i1.MyTripsViewInvited]
class MyTripsViewInvitedRoute extends _i4.PageRouteInfo<void> {
  const MyTripsViewInvitedRoute()
      : super(
          MyTripsViewInvitedRoute.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewInvitedRoute';
}

/// generated route for
/// [_i1.ProfileViewInvited]
class MyProfileViewRouteInvitedRoute extends _i4.PageRouteInfo<void> {
  const MyProfileViewRouteInvitedRoute()
      : super(
          MyProfileViewRouteInvitedRoute.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRouteInvitedRoute';
}

/// generated route for
/// [_i3.HomePageView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home_route',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.MyTripsViewUser]
class MyTripsViewRoute extends _i4.PageRouteInfo<void> {
  const MyTripsViewRoute()
      : super(
          MyTripsViewRoute.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewRoute';
}

/// generated route for
/// [_i1.MyProfileView]
class MyProfileViewRoute extends _i4.PageRouteInfo<void> {
  const MyProfileViewRoute()
      : super(
          MyProfileViewRoute.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HotelsRoute extends _i4.PageRouteInfo<void> {
  const HotelsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HotelsRoute.name,
          path: 'hotels',
          initialChildren: children,
        );

  static const String name = 'HotelsRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FlightsRoute extends _i4.PageRouteInfo<void> {
  const FlightsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          FlightsRoute.name,
          path: 'flights',
          initialChildren: children,
        );

  static const String name = 'FlightsRoute';
}

/// generated route for
/// [_i1.LayoutHotelsView]
class HotelsViewRoute extends _i4.PageRouteInfo<void> {
  const HotelsViewRoute()
      : super(
          HotelsViewRoute.name,
          path: '',
        );

  static const String name = 'HotelsViewRoute';
}

/// generated route for
/// [_i1.HotelDetailsView]
class HotelDetailsViewRoute extends _i4.PageRouteInfo<void> {
  const HotelDetailsViewRoute()
      : super(
          HotelDetailsViewRoute.name,
          path: 'hotel_details',
        );

  static const String name = 'HotelDetailsViewRoute';
}

/// generated route for
/// [_i1.LayoutFlightsView]
class FlightsViewRoute extends _i4.PageRouteInfo<void> {
  const FlightsViewRoute()
      : super(
          FlightsViewRoute.name,
          path: '',
        );

  static const String name = 'FlightsViewRoute';
}

/// generated route for
/// [_i1.FlightDetailsView]
class FlightDetailsViewRoute extends _i4.PageRouteInfo<void> {
  const FlightDetailsViewRoute()
      : super(
          FlightDetailsViewRoute.name,
          path: 'hotel_details',
        );

  static const String name = 'FlightDetailsViewRoute';
}
