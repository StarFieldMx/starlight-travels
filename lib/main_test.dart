// main.dart
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';

// payment_screen.dart
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardEditController controller = CardEditController();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: const CardFormField()),
    );
  }
}

// class PaymentScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           CardField(
//             onCardChanged: (card) {
//               print(card);
//             },
//           ),
//           TextButton(
//             onPressed: () async {
//               // create payment method
//               final paymentMethod = await Stripe.instance.createPaymentMethod(
//                   PaymentMethodParams.card(
//                       paymentMethodData: PaymentMethodData(
//                           billingDetails: BillingDetails(),
//                           shippingDetails: ShippingDetails(
//                               address: Address(
//                                   city: 'city',
//                                   country: 'country',
//                                   line1: 'line1',
//                                   line2: 'line2',
//                                   postalCode: 'postalCode',
//                                   state: 'state')))));
//             },
//             child: Text('pay'),
//           )
//         ],
//       ),
//     );
//   }
// }
