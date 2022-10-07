import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/styles/starlight_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final String labelText;
  final void Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        onPressed: !isLoading ? onTap : null,
        color: StarLightColors.lightBlue,
        minWidth: width * 0.5,
        height: 50,
        child: Text(labelText, style: StarLightTextStyles.primaryButton),
        // minHeight: 200,
      ),
    );
  }
}
