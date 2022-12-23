import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';
import 'package:food_delivery/infrastructure/theme/app_images.dart';

import 'package:food_delivery/screens/auth/screen/auth_screen.dart';

// ---Parameters---
const _kPadding = 50.0;
const _kHeight = 36.0;

class OnBoardingScreen extends StatefulWidget {
  static const _routeName = '/on-boarding';

  static PageRoute<OnBoardingScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const OnBoardingScreen();
      },
    );
  }

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final local = context.localizations;
    return Scaffold(
      backgroundColor: AppColors.backOrange,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundPeople),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const _LogoImage(),
                _TopText(text: local.foodForEveryone),
                const Spacer(),
                _ButtonGetStarted(
                  onPressed: () {
                    Navigator.pushReplacement(context, AuthScreen.route);
                  },
                ),
                const SizedBox(height: _kHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoImage extends StatelessWidget {
  const _LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: _kPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(AppImages.logoApp),
      ),
    );
  }
}

class _TopText extends StatelessWidget {
  const _TopText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: _kPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: context.theme.textTheme.headline1!,
        ),
      ),
    );
  }
}

class _ButtonGetStarted extends StatelessWidget {
  const _ButtonGetStarted({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    return TextButton(
      onPressed: onPressed,
      child: Text(localizations.getStarted),
    );
  }
}
