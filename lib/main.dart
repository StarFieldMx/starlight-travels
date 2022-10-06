import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starlight/providers/providers.dart';
import 'package:starlight/router/guards/guards.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/services/services.dart';
import 'package:starlight/styles/theme_starlight.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPEPUBLICKEY']!;

  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_TOKEN']!,
      appId: dotenv.env['APPID']!,
      messagingSenderId: dotenv.env["SENDERID"]!,
      projectId: dotenv.env["PROYEJCTID"]!,
    ),
  );
  getIt.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final starLightRouter = getIt<AppRouter>();
    final theme = ThemeDataStarLight(context: context);
    return MultiProvider(
      providers: provider(),
      child: MaterialApp.router(
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: theme.starDark,
        routeInformationParser: starLightRouter.defaultRouteParser(),
        routerDelegate: starLightRouter.delegate(),
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
      ChangeNotifierProvider(
        create: (_) => HomeServices(),
      ),
      ChangeNotifierProvider(
        create: (_) => HotelsServices(),
      ),
    ];
  }
}
