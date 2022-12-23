import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:food_delivery/infrastructure/theme/theme.dart';

import 'package:food_delivery/screens/home/screen/home_screen.dart';
import 'package:food_delivery/screens/on_boarding/on_boarding_screen.dart';

class Application extends StatefulWidget {
  const Application({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  final bool isLoggedIn;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      onGenerateRoute: onGenerateRoute,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: getTheme(context),
    );
    return child;
  }

  Route onGenerateRoute(RouteSettings? settings) {
    return widget.isLoggedIn ? HomeScreen.route : OnBoardingScreen.route;
  }
}
