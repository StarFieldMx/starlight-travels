import 'package:flutter/material.dart';

class StarlightInputStyles {
  final Size size;
  StarlightInputStyles({required this.size});
  InputDecoration userInput() {
    return InputDecoration(
      border: _decoBorderStarlight(),
      prefixIcon: const Icon(Icons.person_outline_outlined),
      labelText: "Email",
      hintText: "example@example.com",
    );
  }

  InputDecoration passwordInputEyeOpen(void Function() onTap,
      [String? labelText = "Contraseña"]) {
    return InputDecoration(
      border: _decoBorderStarlight(),
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: onTap,
        child: const Icon(Icons.remove_red_eye_outlined),
      ),
      labelText: labelText,
      hintText: "*********",
    );
  }

  InputDecoration passwordInputEyeClosed(void Function() onTap,
      [String? labelText = "Contraseña"]) {
    return InputDecoration(
      border: _decoBorderStarlight(),
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: onTap,
        child: const Icon(Icons.visibility_off_outlined),
      ),
      labelText: labelText,
      hintText: "*********",
    );
  }

  InputDecoration firstNameInput([String? labelText = "Nombre"]) {
    return InputDecoration(
      border: _decoBorderStarlight(),
      // prefixIcon: const Icon(Icons.lock),
      // suffixIcon: const Icon(Icons.visibility_off_outlined),
      labelText: labelText,
      hintText: "Marcos",
    );
  }

  InputDecoration lastNameInput([String? labelText = "Apellido"]) {
    return InputDecoration(
      border: _decoBorderStarlight(),
      // prefixIcon: const Icon(Icons.lock),
      // suffixIcon: const Icon(Icons.visibility_off_outlined),
      labelText: labelText,
      hintText: "Franco Ezequiel",
    );
  }

  OutlineInputBorder _decoBorderStarlight() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    );
  }
}
