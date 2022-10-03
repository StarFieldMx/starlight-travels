import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/router/starlight_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final BuildContext context;
  AuthGuard({required this.context});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userSate = Provider.of<UserState>(context);
    if (userSate.authentication) {
      router.replace(const StarLightFlowUser());
    } else {
      router.replace(const StarLightFlowInvited());
    }
  }
}
