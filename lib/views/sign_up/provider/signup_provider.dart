import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starlight/models/flights.dart';

class SignUpProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Flights flights = [];
  // controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Getters

  // Setters

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  signUp(BuildContext context) {
    if (isValidForm()) return;
    _saveTempData(context);
  }

  _saveTempData(BuildContext context) async {
    final awa =
        await DefaultAssetBundle.of(context).loadString("assets/trips.json");
    final flights = flightsFromMap(awa);
    print(flights[0]);
  }
}
