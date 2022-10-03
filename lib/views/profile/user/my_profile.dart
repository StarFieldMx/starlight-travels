import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/auth_services.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context, listen: false);
    return Center(
        child: Column(
      children: [
        Text('Profile User'),
        PrimaryButton(
          labelText: 'labelText',
          onTap: () {
            authServices.signOutGoogle(context);
          },
        )
      ],
    ));
  }
}
