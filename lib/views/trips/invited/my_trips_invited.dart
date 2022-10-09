import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/buttons/primary_button.dart';

class MyTripsViewInvited extends StatelessWidget {
  const MyTripsViewInvited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        const Text(
          'Para comprar viajes y hoteles registrate!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        PrimaryButton(
            labelText: "Registrarse",
            onTap: () {
              context.router.pushNamed('sign_in');
            })
      ],
    ));
  }
}
