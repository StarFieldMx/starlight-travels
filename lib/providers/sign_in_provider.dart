import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/auth_services.dart';

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

  void tryLogin() async {
    if (!isValidForm()) return;
    final response =
        await authServices.login(emailController.text, passwordController.text);
    if (response == null) {
      _successResponse();
    } else {
      //  * HAS ERROR
      print(response);
    }
  }

  void loginWithGoogle() async {
    isLoading = true;
    final userResponse = await authServices.signInWithGoogle();
    if (userResponse != null) {
      userState.user = userResponse;
      // Implement change view state of trips
    }
    isLoading = false;
  }

  void _successResponse() {
    userState.login(context);
  }
}
