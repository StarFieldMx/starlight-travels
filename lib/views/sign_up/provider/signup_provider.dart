import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/auth_services.dart';

class SignUpProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  // Getters

  // Setters

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  signUp(BuildContext context) async {
    if (isValidForm()) return;
    isLoading = true;
    final authServices = Provider.of<AuthServices>(context);
    await authServices.createUser(
        email: emailController.text,
        name: firstNameController.text,
        password: passwordController.text,
        lastName: lastNameController.text);
    _saveTempData(context);
    isLoading = false;
  }

  _saveTempData(BuildContext context) async {
    // final awa =
    //     await DefaultAssetBundle.of(context).loadString("assets/trips.json");
    // final flights = flightsFromMap(awa);
    // print(flights[0]);
    isLoading = true;
  }
}
