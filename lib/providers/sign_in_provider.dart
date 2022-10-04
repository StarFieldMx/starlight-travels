// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/auth_services.dart';
import 'package:starlight/services/notification_service.dart';

class SignInProvider extends ChangeNotifier {
  final AuthServices authServices;
  final UserState userState;
  final BuildContext context;
  SignInProvider({
    required this.authServices,
    required this.userState,
    required this.context,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void tryLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!isValidForm()) return;
    isLoading = true;
    final response =
        await authServices.login(emailController.text, passwordController.text);
    if (response == null) {
      isLoading = false;
      _successResponse(context);
    } else {
      NotificationsService.showSnackbar(response);
    }
  }

  void loginWithGoogle(BuildContext context) async {
    isLoading = true;
    final userResponse = await authServices.signInWithGoogle();
    if (userResponse != null) {
      userState.user = userResponse;
      _successResponse(context);
    }
    isLoading = false;
  }

  void _successResponse(BuildContext context) {
    userState.login(context);
  }
}
