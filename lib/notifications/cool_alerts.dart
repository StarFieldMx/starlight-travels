import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class CoolNotifications {
  late BuildContext context;

  CoolNotifications(BuildContext context) {
    context = context;
  }
  static void buySuccess(void Function() onTap, BuildContext context) async {
    await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "¡Su transacción fue exitosa!",
        confirmBtnText: "Siguiente",
        onConfirmBtnTap: onTap,
        loopAnimation: true);
  }

  static void onError(BuildContext context, {String? errorMessage}) async {
    await CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      text: errorMessage ?? "Ups, ocurrio un error inesperado",
    );
  }

  static void infoAlert(BuildContext context, {String? infoMessage}) async {
    await CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      text: infoMessage ?? "Ups, ocurrio un error inesperado",
      loopAnimation: true,
    );
  }

  static void confirmationAlert(BuildContext context,
      {required void Function() onTap, required String question}) async {
    await CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: question,
        confirmBtnText: "Aceptar",
        cancelBtnText: "Cancelar",
        onConfirmBtnTap: onTap,
        loopAnimation: true);
  }
}
