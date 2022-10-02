import 'package:form_field_validator/form_field_validator.dart';

MultiValidator textValidator(String text) => MultiValidator([
      RequiredValidator(errorText: text),
    ]);
