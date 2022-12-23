import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';

final _colorScheme = ColorScheme(
  primary: AppColors.lightOrange,
  onPrimary: AppColors.lightOrange,
  background: AppColors.mediumGrey,
  onBackground: AppColors.black,
  error: AppColors.red,
  onError: AppColors.lightGrey,
  secondary: AppColors.black,
  onSecondary: AppColors.backBlack,
  surface: AppColors.black,
  onSurface: AppColors.black,
  brightness: Brightness.light,
);

final textButtonStyle = ButtonStyle(
  fixedSize: MaterialStateProperty.all(
    const Size(300, 70.0),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
    ),
  ),
  elevation: MaterialStateProperty.all<double>(0),
  foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightOrange),
  overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
);

final textTheme = TextTheme(
  headline1: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 65,
    letterSpacing: -3,
    color: AppColors.white,
  ),
  headline2: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 34,
    color: AppColors.black,
  ),
  headline3: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColors.black,
  ),
  headline4: const TextStyle(
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.black,
  ),
  headline5: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.lightGrey,
  ),
  headline6: const TextStyle(
    fontSize: 15,
    fontFamily: 'Poppins',
    color: AppColors.lightOrange,
  ),
  subtitle1: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: AppColors.black,
  ),
  subtitle2: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: AppColors.black,
  ),
  bodyText1: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w400,
    fontSize: 17,
  ),
  bodyText2: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 22,
  ),
  button: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
    fontSize: 17,
  ),
  caption: const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: AppColors.white,
  ),
  overline: const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColors.backBlack,
  ),
);

ThemeData getTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: _colorScheme,
    textTheme: textTheme,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.black,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3.0,
          color: AppColors.lightOrange,
        ),
        insets: EdgeInsets.symmetric(horizontal: 40.0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: AppColors.lightOrange,
      labelStyle: TextStyle(
        color: AppColors.labelText,
      ),
      iconColor: AppColors.lightOrange,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightOrange,
          width: 3.0,
        ),
      ),
    ),
  );
}
