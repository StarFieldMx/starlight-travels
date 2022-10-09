import 'package:flutter/material.dart';
import 'package:starlight/widgets/widgets.dart';

class CheckStatusProvider extends StatelessWidget {
  const CheckStatusProvider(
      {super.key,
      required this.isLoading,
      required this.isEmpty,
      this.emptyMessage,
      required this.child});
  final bool isLoading;
  final bool isEmpty;
  final String? emptyMessage;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (isLoading) return const LoadinStarlight();
    if (isEmpty) return Center(child: NotAvailable(message: emptyMessage));
    return child;
  }
}
