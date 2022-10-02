import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class FieldFormStarlight extends StatelessWidget {
  const FieldFormStarlight({
    Key? key,
    this.validator,
    this.onChanged,
    required this.keyboardType,
    required this.decoration,
    this.controller,
    this.initialValue,
    this.isEnabled = true,
    this.canExpand = false,
    this.obscureText = false,
  }) : super(key: key);
  final InputDecoration decoration;
  final String? initialValue;
  final TextEditingController? controller;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final bool canExpand;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: StarLightColors.starLight,
      ),
      decoration: decoration,
      initialValue: initialValue,
      controller: controller,
      enabled: isEnabled,
      validator: validator,
      expands: canExpand,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
