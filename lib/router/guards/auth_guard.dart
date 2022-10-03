import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/router/starlight_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext;
    final userSate = Provider.of<UserState>(context!, listen: false);
    if (userSate.authentication) {
      router.replace(const StarLightFlowUser());
    } else {
      router.replace(const StarLightFlowInvited());
    }
  }
}
