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
        const Text('My Trips'),
        PrimaryButton(
            labelText: "Go to sign_in",
            onTap: () {
              context.router.pushNamed('sign_in');
            })
      ],
    ));
  }
}
