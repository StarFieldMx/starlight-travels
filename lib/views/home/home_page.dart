import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/home_services.dart';
import 'package:starlight/services/services.dart' show HomeServices;
import 'package:starlight/views/home/widgets/options_starlight.dart';
import 'package:starlight/views/layout/layout_home_view.dart';
import 'package:starlight/widgets/loading_starlight.dart';

import 'widgets/card_home.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeServices = Provider.of<HomeServices>(context);
    final userState = Provider.of<UserState>(context);
    Provider.of<UserState>(context, listen: false).context = context;
    bool hasUser = userState.user == null ? false : true;
    final size = MediaQuery.of(context).size;
    if (homeServices.isLoading) {
      return const LoadinStarlight();
    }
    return LayoutHomeView(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            // LOGO STARLIGHT
            if (!hasUser) const OptionsStarlight(),
            SizedBox(
              height: size.height * 0.05,
            ),
            CardHomeItem(
              image: homeServices.homeItem!.becomeMember.imageUrl,
              info: homeServices.homeItem!.becomeMember.info,
              title: homeServices.homeItem!.becomeMember.title,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CardHomeItem(
              image: homeServices.homeItem!.nextTrip[0].imageUrl,
              info: homeServices.homeItem!.nextTrip[0].info,
              title: homeServices.homeItem!.nextTrip[0].title,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CardHomeItem(
              image: homeServices.homeItem!.nextTrip[1].imageUrl,
              info: homeServices.homeItem!.nextTrip[1].info,
              title: homeServices.homeItem!.nextTrip[1].title,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
