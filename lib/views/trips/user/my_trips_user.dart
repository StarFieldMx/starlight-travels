import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:starlight/views/payment/payment_screen.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';

class MyTripsViewUser extends StatefulWidget {
  const MyTripsViewUser({super.key});

  @override
  State<MyTripsViewUser> createState() => _MyTripsViewUserState();
}

class _MyTripsViewUserState extends State<MyTripsViewUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}
