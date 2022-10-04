import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starlight/providers/providers.dart';
import 'package:starlight/router/guards/guards.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/services.dart';
import 'package:starlight/styles/theme_starlight.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBsXjft_FDGmBIwlV1Snbh_tnmVq6DKoHM",
      appId: "com.example.starlight",
      messagingSenderId: "215491214676",
      projectId: "starlight-flights",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _starLightRouter = AppRouter(authGuard: AuthGuard());
    final theme = ThemeDataStarLight(context: context);
    return MultiProvider(
      providers: provider(),
      child: MaterialApp.router(
        theme: theme.starDark,
        routeInformationParser: _starLightRouter.defaultRouteParser(),
        routerDelegate: _starLightRouter.delegate(),
      ),
    );
  }

  List<SingleChildWidget> provider() {
    return [
      ChangeNotifierProvider(
        create: (_) => FlightsServices(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthServices(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserState(),
      ),
    ];
  }
}
