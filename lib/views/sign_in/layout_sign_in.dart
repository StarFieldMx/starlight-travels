import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/providers/providers.dart';
import 'package:starlight/services/auth_services.dart';
import 'package:starlight/views/sign_in/widgets/card_sign_in.dart';

class LayoutSignIn extends StatelessWidget {
  const LayoutSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authServices = Provider.of<AuthServices>(context);
    final userState = Provider.of<UserState>(context);
    return Stack(children: [
      Positioned(
        top: 30,
        left: size.width * 0.5 - 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(360),
          child: const Image(
              width: 120,
              height: 120,
              image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAGF-l78tFiDIhqbt22M50gAPLrFQGBh_K1mXbStfQg%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1")),
        ),
      ),
      Positioned(
        top: 120,
        child: ChangeNotifierProvider(
          create: (_) => SignInProvider(
              authServices: authServices,
              userState: userState,
              context: context),
          child: CardSignIn(size: size),
        ),
      ),
    ]);
  }
}
