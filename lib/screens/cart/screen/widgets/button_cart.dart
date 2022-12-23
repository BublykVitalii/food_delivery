import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50.0,
        right: 50.0,
        bottom: 20,
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.backOrange),
        ),
        child: Text(
          context.localizations.checkout,
          style:
              context.theme.textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
