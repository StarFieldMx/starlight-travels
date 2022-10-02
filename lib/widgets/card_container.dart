import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 30.0),
    this.innerPadding = const EdgeInsets.all(20.0),
    this.innerClipBehavior = Clip.none,
    this.onTap,
    this.boder,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets innerPadding;
  final Clip innerClipBehavior;
  final Border? boder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: CardShadow(
          padding: innerPadding,
          clipBehavior: innerClipBehavior,
          border: boder,
          child: child,
        ),
      ),
    );
  }
}

class CardShadow extends StatelessWidget {
  const CardShadow({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(20.0),
    this.clipBehavior = Clip.none,
    this.border,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final Clip clipBehavior;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      decoration: _createCardShape(border),
      padding: padding,
      clipBehavior: clipBehavior,
      duration: const Duration(milliseconds: 250),
      child: child,
    );
  }

  BoxDecoration _createCardShape(Border? border) => BoxDecoration(
        color: StarLightColors.starPrimaryBlue,
        borderRadius: BorderRadius.circular(25),
        border: border,
        boxShadow: [
          BoxShadow(
            color: StarLightColors.starThirdBlue,
            offset: const Offset(0, 5),
            blurRadius: 15,
          ),
        ],
      );
}
