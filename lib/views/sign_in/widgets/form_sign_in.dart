import 'package:flutter/material.dart';
// STYLES
import 'package:starlight/styles/starlight_inputs.dart';
// WIDGETS
import 'package:starlight/widgets/fields/index.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';
import 'package:starlight/widgets/form_structure.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inputDecoration = StarlightInputStyles(size: size);
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return FormStructure(
      formKey: key,
      childrens: [
        const EmailField(
          initialValue: '',
          // ! Implement provider
        ),
        PasswordField(
          inputDecoration: inputDecoration,
          labelText: "Ingresa tu contraseña", initialValue: '',
          // ! Implement provider
        ),
        PrimaryButton(
          labelText: "SignIn",
          onTap: () {},
        ),
      ],
    );
  }
}
