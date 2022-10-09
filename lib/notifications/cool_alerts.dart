import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

const animType = CoolAlertAnimType.rotate;

class CoolNotifications {
  late BuildContext context;

  CoolNotifications(BuildContext context) {
    context = context;
  }
  static void buySuccess(void Function() onTap, BuildContext context) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "¡Su transacción fue exitosa!",
      confirmBtnText: "Siguiente",
      onConfirmBtnTap: onTap,
      animType: animType,
    );
  }

  static void onError(BuildContext context, {String? errorMessage}) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      text: errorMessage ?? "Ups, ocurrio un error inesperado",
      animType: animType,
    );
  }

  static void infoAlert(BuildContext context, {String? infoMessage}) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      text: infoMessage ?? "Ups, ocurrio un error inesperado",
      animType: animType,
    );
  }

  static void confirmationAlert(BuildContext context,
      {required void Function() onTap, required String question}) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: question,
      confirmBtnText: "Aceptar",
      cancelBtnText: "Cancelar",
      onConfirmBtnTap: () {
        onTap();
        context.router.pop();
      },
      animType: animType,
    );
  }
}
