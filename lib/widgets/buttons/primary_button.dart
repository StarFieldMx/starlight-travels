import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/styles/starlight_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.labelText,
    required this.onTap,
  }) : super(key: key);
  final String labelText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      colorBrightness: Brightness.light,
      onPressed: onTap,
      color: StarLightColors.lightBlue,
      minWidth: 150,
      child: Text(labelText, style: StarLightTextStyles.primaryButton),
      // minHeight: 200,
    );
  }
}
