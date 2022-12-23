import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:food_delivery/application.dart';
import 'package:food_delivery/infrastructure/injectable.init.dart';
import 'package:food_delivery/screens/auth/domain/auth_service.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final getIt = GetIt.instance;
  await configureDependencies(getIt);

  final AuthService authService = getIt.get<AuthService>();
  final loggedIn = await authService.inLoggedIn();

  runApp(Application(isLoggedIn: loggedIn));
}
