import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/sign_in_provider.dart';
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
    final signInProvider = Provider.of<SignInProvider>(context);
    final signInProviderOff =
        Provider.of<SignInProvider>(context, listen: false);
    return FormStructure(
      formKey: signInProviderOff.formKey,
      childrens: [
        EmailField(
          controller: signInProvider.emailController,
          // ! Implement provider
        ),
        PasswordField(
          inputDecoration: inputDecoration,
          controller: signInProvider.passwordController,
          labelText: "Ingresa tu contraseña",
          // ! Implement provider
        ),
        PrimaryButton(
          labelText: "SignIn",
          isLoading: signInProvider.isLoading,
          onTap: () => signInProviderOff.tryLogin(),
        ),
        const _GoogleSignIn(),
      ],
    );
  }
}

class _GoogleSignIn extends StatelessWidget {
  const _GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    return Center(
      child: GestureDetector(
        onTap: signInProvider.isLoading
            ? null
            : () {
                signInProvider.loginWithGoogle();
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/google.png'), fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            const Text(
              'Sign in with Google',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
