import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/styles/starlight_colors.dart';

class OptionsStarlight extends StatelessWidget {
  const OptionsStarlight({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            // color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
              width: 3,
              color: StarLightColors.starLight,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: width * 0.8,
              height: width * 0.14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: const _RedirectToBrowse(
                      icon: Icons.hotel,
                      type: 'Hoteles',
                      // TODO:
                      // ! Redirect
                    ),
                    onTap: () => context.router.push(
                        const ServicesViewRoute(children: [HotelsViewRoute()])),
                  ),
                  VerticalDivider(
                    color: StarLightColors.starLight, //color of divider
                    width: 1,
                    thickness: 3, //thickness of divier line
                    indent: 0, //spacing at the start of divider
                    endIndent: 0, //spacing at the end of divider
                  ),
                  GestureDetector(
                    child: const _RedirectToBrowse(
                      icon: Icons.airplane_ticket_rounded,
                      type: 'Viajes',
                      // ! Redirect
                    ),
                    onTap: () => context.router.push(const ServicesViewRoute(
                        children: [FlightsViewRoute()])),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}

class _RedirectToBrowse extends StatelessWidget {
  const _RedirectToBrowse({required this.type, required this.icon});
  final String type;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(
            width: 5,
          ),
          Text(type, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  BorderSide getBorder() {
    return BorderSide(width: 2, color: StarLightColors.starLight);
  }
}
