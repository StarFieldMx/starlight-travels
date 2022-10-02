import 'package:form_field_validator/form_field_validator.dart';

// ? Based on Regexr.com comunnity validation regexr.com/38pvb

final cellphoneValidator = MultiValidator([
  RequiredValidator(errorText: 'El número de teléfono es requerido'),
  MinLengthValidator(10, errorText: 'Debe contener 10 dígitos'),
  PatternValidator(
      r'^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$',
      errorText: 'Número de celular inválido'),
]);
