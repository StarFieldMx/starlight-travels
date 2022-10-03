import 'package:auto_route/auto_route.dart';
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
      // guards: [SignInGuard],
      // initial: true,
    ),
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
      name: 'HomeView',
      page: HomePageView,
    ),
    AutoRoute(
      path: 'my_trips',
      name: 'MyTripsViewInvited',
      page: MyTripsViewInvited,
    ),
    AutoRoute(
      path: 'profile_route',
      name: 'MyProfileViewRouteInvited',
      page: ProfileViewInvited,
    ),
  ],
);

const starLightFlow = AutoRoute(
  path: '/flow_user',
  name: "StarLightFlowUser",
  initial: true,
  page: StarLightFlowInvited,
  children: [
    AutoRoute(
      path: 'home',
      name: 'HomeView',
      page: HomePageView,
    ),
    AutoRoute(
      path: 'my_trips',
      name: 'MyTripsView',
      page: MyTripsViewUser,
    ),
    AutoRoute(
      path: 'profile_route',
      name: 'MyProfileView',
      page: MyProfileView,
    ),
  ],
);
