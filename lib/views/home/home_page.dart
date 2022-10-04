import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/user_state.dart';
import 'package:starlight/services/services.dart' show FlightsServices;
import 'package:starlight/views/home/widgets/options_starlight.dart';
import 'package:starlight/views/layout/layout_home_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightsService = Provider.of<FlightsServices>(context);
    final userState = Provider.of<UserState>(context);
    bool hasUser = userState.user == null ? false : true;
    return LayoutHomeView(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!hasUser) const OptionsStarlight(),
          ],
        ),
      ),
    );
  }
}
