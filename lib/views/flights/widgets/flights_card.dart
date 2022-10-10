import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/notifications/cool_alerts.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/notification_service.dart';
import 'package:starlight/styles/starlight_colors.dart';
import 'package:starlight/utils/parse_time.dart';
import 'package:starlight/widgets/buttons/primary_button.dart';
import 'package:starlight/widgets/multiply_text.dart';
import 'package:starlight/widgets/widgets.dart';

import '../../../services/my_buys_services.dart';

class FlightsCard extends StatefulWidget {
  const FlightsCard({super.key, required this.flight, this.isBuying = true});
  final Flight flight;
  final bool isBuying;

  @override
  State<FlightsCard> createState() => _FlightsCardState();
}

class _FlightsCardState extends State<FlightsCard> {
  bool state = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200), () {
      state = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final bool isAuth = userState.authentication;
    final String buyOrCancel = widget.isBuying ? "Comprar" : "Cancelar";
    final myServices = Provider.of<MyServices>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        alignment: Alignment.center,
        foregroundDecoration: _cardBorders(),
        onEnd: () {
          state = !state;
          setState(() {});
        },
        duration: const Duration(seconds: 3),
        // ! Margi in view!!!
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        width: double.infinity,
        // ! Change for dynamic value
        height: 150,
        // decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const AssetBackground(
              height: 400,
            ),
            DetailsText(
              child: MultiplyText(
                textList: [
                  {"time": "${widget.flight.depTime}-${widget.flight.arrTime}"},
                  "${widget.flight.from.name}(${widget.flight.from.code})",
                  "${widget.flight.to.name}(${widget.flight.to.code})",
                  parseTime(widget.flight.flighTime),
                  widget.flight.airline,
                ],
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: PriceTag(
                  price: widget.flight.price.toDouble(),
                  typeTrip: widget.flight.type.name,
                )),
            Positioned(
                bottom: 15,
                right: 15,
                child: SizedBox(
                    height: 35,
                    width: 120,
                    child: PrimaryButton(
                      color: widget.isBuying ? null : Colors.red,
                      labelText: buyOrCancel,
                      onTap: () {
                        if (!isAuth) {
                          CoolNotifications.infoAlert(context,
                              infoMessage:
                                  "Necesitas estar registrado para comprar");
                        }
                        if (widget.isBuying && isAuth) {
                          CoolNotifications.confirmationAlert(context,
                              onTap: () => context.router.push(
                                  PaymentViewRoute(flight: widget.flight)),
                              question:
                                  '¿Deseas continuar con la reservación?');
                        }
                        if (!widget.isBuying && isAuth) {
                          CoolNotifications.confirmationAlert(context,
                              onTap: () => myServices.deleteServices(
                                  widget.flight, context),
                              question: '¿Deseas continuar cancelar tu vuelo?');
                        }
                      },
                    )))
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: state
              ? StarLightColors.starLight.withOpacity(0.0)
              : StarLightColors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}
