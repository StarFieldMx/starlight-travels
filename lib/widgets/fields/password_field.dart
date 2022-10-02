import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_inputs.dart';
import 'package:starlight/validations/index.dart';
import 'package:starlight/widgets/fields/field_starlight.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.inputDecoration,
    // required this.onChanged,
    this.labelText,
    this.controller,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final StarlightInputStyles inputDecoration;
  final String? labelText;
  @override
  State<PasswordField> createState() => _FieldFormPasswordState();
}

class _FieldFormPasswordState extends State<PasswordField> {
  bool isOpen = false;
  bool isObscured = true;
  InputDecoration _getEyeDecoration() {
    if (isOpen) {
      return widget.inputDecoration
          .passwordInputEyeOpen(_changeState, widget.labelText);
    }
    return widget.inputDecoration
        .passwordInputEyeClosed(_changeState, widget.labelText);
  }

  void _changeState() {
    isOpen = !isOpen;
    isObscured = !isObscured;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FieldFormStarlight(
      decoration: _getEyeDecoration(),
      keyboardType: TextInputType.text,
      // validator: passwordValidator,
      obscureText: isObscured,
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      onChanged: widget.controller == null ? widget.onChanged : null,
    );
  }
}
