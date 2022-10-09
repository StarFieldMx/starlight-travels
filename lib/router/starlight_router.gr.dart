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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../models/flights.dart' as _i10;
import '../models/hotels.dart' as _i11;
import '../models/rooms.dart' as _i9;
import '../views/home/home_page.dart' as _i4;
import '../views/hotels/rooms_view.dart' as _i5;
import '../views/main_views.dart' as _i1;
import '../views/payment/payment_screen.dart' as _i2;
import 'guards/guards.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StarLightFlowInvited.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowInvited(),
      );
    },
    StarLightFlowUser.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StarLightFlowUser(),
      );
    },
    LayoutSignSelectRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutSignSelect(),
      );
    },
    MainViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    PaymentViewRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentViewRouteArgs>(
          orElse: () => const PaymentViewRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.PaymentScreen(
          key: args.key,
          room: args.room,
          flight: args.flight,
        ),
      );
    },
    ServicesViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HomeViewInvitedRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePageView(),
      );
    },
    MyTripsViewInvitedRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewInvited(),
      );
    },
    MyProfileViewRouteInvitedRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileViewInvited(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePageView(),
      );
    },
    MyTripsViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsViewUser(),
      );
    },
    MyProfileViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyProfileView(),
      );
    },
    HotelsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    FlightsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HotelsViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutHotelsView(),
      );
    },
    HotelDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<HotelDetailsViewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HotelDetailsView(
          key: args.key,
          hotel: args.hotel,
          index: args.index,
        ),
      );
    },
    RoomsView.name: (routeData) {
      final args = routeData.argsAs<RoomsViewArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.RoomsView(
          key: args.key,
          hotelName: args.hotelName,
        ),
      );
    },
    FlightsViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutFlightsView(),
      );
    },
    FlightDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<FlightDetailsViewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.FlightDetailsView(
          key: args.key,
          flight: args.flight,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/flow',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          StarLightFlowInvited.name,
          path: '/flow',
          children: [
            _i6.RouteConfig(
              HomeViewInvitedRoute.name,
              path: 'home',
              parent: StarLightFlowInvited.name,
            ),
            _i6.RouteConfig(
              MyTripsViewInvitedRoute.name,
              path: 'my_trips',
              parent: StarLightFlowInvited.name,
            ),
            _i6.RouteConfig(
              MyProfileViewRouteInvitedRoute.name,
              path: 'profile_route',
              parent: StarLightFlowInvited.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          StarLightFlowUser.name,
          path: '/flow_user',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home_route',
              parent: StarLightFlowUser.name,
            ),
            _i6.RouteConfig(
              MyTripsViewRoute.name,
              path: 'my_trips',
              parent: StarLightFlowUser.name,
            ),
            _i6.RouteConfig(
              MyProfileViewRoute.name,
              path: 'profile_route',
              parent: StarLightFlowUser.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        ),
        _i6.RouteConfig(
          MainViewRoute.name,
          path: 'main',
          guards: [authGuard],
        ),
        _i6.RouteConfig(
          PaymentViewRoute.name,
          path: 'payment',
        ),
        _i6.RouteConfig(
          ServicesViewRoute.name,
          path: 'services',
          children: [
            _i6.RouteConfig(
              HotelsRoute.name,
              path: 'hotels',
              parent: ServicesViewRoute.name,
              children: [
                _i6.RouteConfig(
                  HotelsViewRoute.name,
                  path: '',
                  parent: HotelsRoute.name,
                ),
                _i6.RouteConfig(
                  HotelDetailsViewRoute.name,
                  path: 'hotel_details',
                  parent: HotelsRoute.name,
                ),
                _i6.RouteConfig(
                  RoomsView.name,
                  path: 'rooms',
                  parent: HotelsRoute.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              FlightsRoute.name,
              path: 'flights',
              parent: ServicesViewRoute.name,
              children: [
                _i6.RouteConfig(
                  FlightsViewRoute.name,
                  path: '',
                  parent: FlightsRoute.name,
                ),
                _i6.RouteConfig(
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
class StarLightFlowInvited extends _i6.PageRouteInfo<void> {
  const StarLightFlowInvited({List<_i6.PageRouteInfo>? children})
      : super(
          StarLightFlowInvited.name,
          path: '/flow',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowInvited';
}

/// generated route for
/// [_i1.StarLightFlowUser]
class StarLightFlowUser extends _i6.PageRouteInfo<void> {
  const StarLightFlowUser({List<_i6.PageRouteInfo>? children})
      : super(
          StarLightFlowUser.name,
          path: '/flow_user',
          initialChildren: children,
        );

  static const String name = 'StarLightFlowUser';
}

/// generated route for
/// [_i1.LayoutSignSelect]
class LayoutSignSelectRoute extends _i6.PageRouteInfo<void> {
  const LayoutSignSelectRoute()
      : super(
          LayoutSignSelectRoute.name,
          path: 'sign_in',
        );

  static const String name = 'LayoutSignSelectRoute';
}

/// generated route for
/// [_i1.MainView]
class MainViewRoute extends _i6.PageRouteInfo<void> {
  const MainViewRoute()
      : super(
          MainViewRoute.name,
          path: 'main',
        );

  static const String name = 'MainViewRoute';
}

/// generated route for
/// [_i2.PaymentScreen]
class PaymentViewRoute extends _i6.PageRouteInfo<PaymentViewRouteArgs> {
  PaymentViewRoute({
    _i7.Key? key,
    _i9.Rooms? room,
    _i10.Flight? flight,
  }) : super(
          PaymentViewRoute.name,
          path: 'payment',
          args: PaymentViewRouteArgs(
            key: key,
            room: room,
            flight: flight,
          ),
        );

  static const String name = 'PaymentViewRoute';
}

class PaymentViewRouteArgs {
  const PaymentViewRouteArgs({
    this.key,
    this.room,
    this.flight,
  });

  final _i7.Key? key;

  final _i9.Rooms? room;

  final _i10.Flight? flight;

  @override
  String toString() {
    return 'PaymentViewRouteArgs{key: $key, room: $room, flight: $flight}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ServicesViewRoute extends _i6.PageRouteInfo<void> {
  const ServicesViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ServicesViewRoute.name,
          path: 'services',
          initialChildren: children,
        );

  static const String name = 'ServicesViewRoute';
}

/// generated route for
/// [_i4.HomePageView]
class HomeViewInvitedRoute extends _i6.PageRouteInfo<void> {
  const HomeViewInvitedRoute()
      : super(
          HomeViewInvitedRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewInvitedRoute';
}

/// generated route for
/// [_i1.MyTripsViewInvited]
class MyTripsViewInvitedRoute extends _i6.PageRouteInfo<void> {
  const MyTripsViewInvitedRoute()
      : super(
          MyTripsViewInvitedRoute.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewInvitedRoute';
}

/// generated route for
/// [_i1.ProfileViewInvited]
class MyProfileViewRouteInvitedRoute extends _i6.PageRouteInfo<void> {
  const MyProfileViewRouteInvitedRoute()
      : super(
          MyProfileViewRouteInvitedRoute.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRouteInvitedRoute';
}

/// generated route for
/// [_i4.HomePageView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home_route',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.MyTripsViewUser]
class MyTripsViewRoute extends _i6.PageRouteInfo<void> {
  const MyTripsViewRoute()
      : super(
          MyTripsViewRoute.name,
          path: 'my_trips',
        );

  static const String name = 'MyTripsViewRoute';
}

/// generated route for
/// [_i1.MyProfileView]
class MyProfileViewRoute extends _i6.PageRouteInfo<void> {
  const MyProfileViewRoute()
      : super(
          MyProfileViewRoute.name,
          path: 'profile_route',
        );

  static const String name = 'MyProfileViewRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HotelsRoute extends _i6.PageRouteInfo<void> {
  const HotelsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HotelsRoute.name,
          path: 'hotels',
          initialChildren: children,
        );

  static const String name = 'HotelsRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class FlightsRoute extends _i6.PageRouteInfo<void> {
  const FlightsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FlightsRoute.name,
          path: 'flights',
          initialChildren: children,
        );

  static const String name = 'FlightsRoute';
}

/// generated route for
/// [_i1.LayoutHotelsView]
class HotelsViewRoute extends _i6.PageRouteInfo<void> {
  const HotelsViewRoute()
      : super(
          HotelsViewRoute.name,
          path: '',
        );

  static const String name = 'HotelsViewRoute';
}

/// generated route for
/// [_i1.HotelDetailsView]
class HotelDetailsViewRoute
    extends _i6.PageRouteInfo<HotelDetailsViewRouteArgs> {
  HotelDetailsViewRoute({
    _i7.Key? key,
    required _i11.Hotel hotel,
    required int index,
  }) : super(
          HotelDetailsViewRoute.name,
          path: 'hotel_details',
          args: HotelDetailsViewRouteArgs(
            key: key,
            hotel: hotel,
            index: index,
          ),
        );

  static const String name = 'HotelDetailsViewRoute';
}

class HotelDetailsViewRouteArgs {
  const HotelDetailsViewRouteArgs({
    this.key,
    required this.hotel,
    required this.index,
  });

  final _i7.Key? key;

  final _i11.Hotel hotel;

  final int index;

  @override
  String toString() {
    return 'HotelDetailsViewRouteArgs{key: $key, hotel: $hotel, index: $index}';
  }
}

/// generated route for
/// [_i5.RoomsView]
class RoomsView extends _i6.PageRouteInfo<RoomsViewArgs> {
  RoomsView({
    _i7.Key? key,
    required String hotelName,
  }) : super(
          RoomsView.name,
          path: 'rooms',
          args: RoomsViewArgs(
            key: key,
            hotelName: hotelName,
          ),
        );

  static const String name = 'RoomsView';
}

class RoomsViewArgs {
  const RoomsViewArgs({
    this.key,
    required this.hotelName,
  });

  final _i7.Key? key;

  final String hotelName;

  @override
  String toString() {
    return 'RoomsViewArgs{key: $key, hotelName: $hotelName}';
  }
}

/// generated route for
/// [_i1.LayoutFlightsView]
class FlightsViewRoute extends _i6.PageRouteInfo<void> {
  const FlightsViewRoute()
      : super(
          FlightsViewRoute.name,
          path: '',
        );

  static const String name = 'FlightsViewRoute';
}

/// generated route for
/// [_i1.FlightDetailsView]
class FlightDetailsViewRoute
    extends _i6.PageRouteInfo<FlightDetailsViewRouteArgs> {
  FlightDetailsViewRoute({
    _i7.Key? key,
    required _i10.Flight flight,
  }) : super(
          FlightDetailsViewRoute.name,
          path: 'hotel_details',
          args: FlightDetailsViewRouteArgs(
            key: key,
            flight: flight,
          ),
        );

  static const String name = 'FlightDetailsViewRoute';
}

class FlightDetailsViewRouteArgs {
  const FlightDetailsViewRouteArgs({
    this.key,
    required this.flight,
  });

  final _i7.Key? key;

  final _i10.Flight flight;

  @override
  String toString() {
    return 'FlightDetailsViewRouteArgs{key: $key, flight: $flight}';
  }
}
