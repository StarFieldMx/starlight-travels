import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'La contraseña es requerida'),
  MinLengthValidator(8,
      errorText: 'La contraseña debe ser mínimo de 8 caracteres'),
  PatternValidator(r'(?=.*?[A-Z])',
      errorText: 'Debe tener al menos una letra mayúscula'),
  PatternValidator(r'(?=.*?[0-9])', errorText: 'Debe tener al menos un número'),
  PatternValidator(r'(?=.*?[-+_!@#%$^&*.,?])',
      errorText: 'Debe tener al menos un caracter especial.'),
]);
