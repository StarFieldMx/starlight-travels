import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/styles/starlight_inputs.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';
import 'package:starlight/widgets/fields/email_field.dart';
import 'package:starlight/widgets/fields/first_name_field.dart';
import 'package:starlight/widgets/fields/last_name_field.dart';
import 'package:starlight/widgets/fields/password_field.dart';
import 'package:starlight/widgets/form_structure.dart';

import '../provider/signup_provider.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final inputStyles = StarlightInputStyles(size: size);
    return FormStructure(
      formKey: signUpProvider.formKey,
      childrens: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.41,
              child: FirstNameField(
                controller: signUpProvider.firstNameController,
              ),
            ),
            SizedBox(
              width: size.width * 0.41,
              child: LastNameField(
                controller: signUpProvider.lastNameController,
              ),
            ),
          ],
        ),
        EmailField(
          controller: signUpProvider.emailController,
        ),
        PasswordField(
          inputDecoration: inputStyles,
          labelText: "Crea una contraseña",
          controller: signUpProvider.passwordController,
        ),
        PrimaryButton(
          labelText: "Registrarse",
          onTap: () => signUpProvider.signUp(context),
        )
      ],
    );
  }
}
