import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> initPaymentSheet() async {
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: const SetupPaymentSheetParameters(
      appearance: PaymentSheetAppearance(
        colors: PaymentSheetAppearanceColors(
          background: Colors.lightBlue,
          primary: Colors.blue,
          componentBorder: Colors.red,
        ),
        shapes: PaymentSheetShape(
          borderWidth: 4,
          shadow: PaymentSheetShadowParams(color: Colors.red),
        ),
        primaryButton: PaymentSheetPrimaryButtonAppearance(
          shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
          colors: PaymentSheetPrimaryButtonTheme(
            light: PaymentSheetPrimaryButtonThemeColors(
              background: Color.fromARGB(255, 231, 235, 30),
              text: Color.fromARGB(255, 235, 92, 30),
              border: Color.fromARGB(255, 235, 92, 30),
            ),
          ),
        ),
      ),
    ),
  );
}
