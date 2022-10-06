import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:starlight/router/guards/guards.dart';
import 'package:starlight/views/home/home_page.dart';
import 'package:starlight/views/main_views.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    starLightFlowInvited,
    starLightFlow,
    AutoRoute(
      path: 'sign_in',
      name: "LayoutSignSelectRoute",
      page: LayoutSignSelect,
    ),
    AutoRoute(
      path: 'main',
      name: "MainViewRoute",
      page: MainView,
      guards: [AuthGuard],
      // initial: true,
    ),
    AutoRoute(
      path: 'services',
      name: "ServicesViewRoute",
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: 'hotels',
          name: 'HotelsViewRoute',
          page: LayoutHotelsView,
        ),
        AutoRoute(
          path: 'flights',
          name: 'FlightsViewRoute',
          page: LayoutFlightsView,
        ),
      ],
    )
  ],
)
class $AppRouter {}

const starLightFlowInvited = AutoRoute(
  path: '/flow',
  name: "StarLightFlowInvited",
  initial: true,
  page: StarLightFlowInvited,
  children: [
    AutoRoute(
      path: 'home',
      name: 'HomeViewInvitedRoute',
      page: HomePageView,
    ),
    AutoRoute(
      path: 'my_trips',
      name: 'MyTripsViewInvitedRoute',
      page: MyTripsViewInvited,
    ),
    AutoRoute(
      path: 'profile_route',
      name: 'MyProfileViewRouteInvitedRoute',
      page: ProfileViewInvited,
    ),
  ],
);

const starLightFlow = AutoRoute(
  path: '/flow_user',
  name: "StarLightFlowUser",
  initial: true,
  page: StarLightFlowUser,
  children: [
    AutoRoute(
      path: 'home_route',
      name: 'HomeRoute',
      page: HomePageView,
    ),
    AutoRoute(
      path: 'my_trips',
      name: 'MyTripsViewRoute',
      page: MyTripsViewUser,
    ),
    AutoRoute(
      path: 'profile_route',
      name: 'MyProfileViewRoute',
      page: MyProfileView,
    ),
  ],
);
