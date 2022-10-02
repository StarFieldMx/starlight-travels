import 'package:form_field_validator/form_field_validator.dart';

MultiValidator nameFieldValidator(
        String? textError, String? extensionError, String? charError) =>
    MultiValidator([
      RequiredValidator(errorText: textError ?? 'El campo es requerido'),
      MaxLengthValidator(30,
          errorText: extensionError ?? 'El campo no puede ser tan extenso'),
      PatternValidator(r'^[A-Za-z\s]*$',
          errorText:
              charError ?? 'El campo no puede contener caracteres especiales'),
    ]);
