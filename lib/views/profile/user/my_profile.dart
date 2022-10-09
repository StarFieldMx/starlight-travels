import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/auth_services.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context, listen: false);
    final userState = Provider.of<UserState>(context, listen: false);
    // return PaymentScreen2();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Text('Profile User'),
        Text(userState.user?.email ?? ''),
        Text(userState.user?.displayName ?? ''),
        Text(userState.user?.phoneNumber ?? ''),
        PrimaryButton(
          labelText: 'cerrar sesión',
          onTap: () {
            authServices.signOutGeneral(context);
          },
        )
      ],
    ));
  }
}
