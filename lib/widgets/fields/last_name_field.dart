import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_inputs.dart';
import 'package:starlight/validations/name_validator.dart';
import 'package:starlight/widgets/fields/field_starlight.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    Key? key,
    this.controller,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inputStyles = StarlightInputStyles(size: size);
    return FieldFormStarlight(
      decoration: inputStyles.lastNameInput(),
      keyboardType: TextInputType.text,
      controller: controller,
      validator: nameFieldValidator("El apellido es requerido", null, null),
      initialValue: controller == null ? initialValue : null,
      onChanged: controller == null ? onChanged : null,
    );
  }
}
