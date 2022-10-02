import 'package:form_field_validator/form_field_validator.dart';

MultiValidator addressFieldValidator() => MultiValidator([
      RequiredValidator(errorText: 'El domicilio es requerido'),
      MinLengthValidator(2, errorText: 'Domicilio inválido'),
      MaxLengthValidator(50,
          errorText: 'El domicilio no puede ser tan extenso'),
      PatternValidator(r'^[A-Za-z\s]*$',
          errorText: 'El domicilio no puede contener caracteres especiales'),
    ]);
