import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
// import 'package:starlight/router/guards/guards.dart';
import 'package:starlight/views/home/home_page.dart';
import 'package:starlight/views/layout/starlight_flow.dart';
import 'package:starlight/views/main_views.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    starLightFlow,
  ],
)
class $AppRouter {}

const starLightFlow = AutoRoute(
  path: '/flow',
  name: "StarLightFlow",
  initial: true,
  page: StarLightFlow,
  children: [
    AutoRoute(
      path: 'home',
      name: 'HomeView',
      page: HomePageView,
    ),
    AutoRoute(
      path: 'my_trips',
      name: 'MyTripsView',
      page: MyTripsView,
    ),
    AutoRoute(
        path: 'profile_route',
        name: 'MyProfileViewRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: 'profile',
            name: 'MyProfileView',
            page: ProfileView,
            initial: true,
          ),
          AutoRoute(
            path: 'sign_in',
            name: "LayoutSignSelectRoute",
            page: LayoutSignSelect,
            // guards: [SignInGuard],
            // initial: true,
          ),
        ]),
  ],
);
