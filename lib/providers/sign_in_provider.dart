import 'package:flutter/material.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/auth_services.dart';

class SignInProvider extends ChangeNotifier {
  final AuthServices authServices;
  final UserState userState;
  SignInProvider({
    required this.authServices,
    required this.userState,
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
    if (!response.containsKey('error')) {
      _successResponse(response);
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

  void _successResponse(Map<String, dynamic> value) {
    final Map<String, dynamic> cleanMap = {};
    if (value.containsKey('kind')) {
      value.remove('kind');
      cleanMap.addAll(value);
    } else {
      cleanMap.addAll(value);
    }
    userState.user = UserStarlight.fromMap(cleanMap);
  }
}
