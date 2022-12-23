import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class ButtonCartOff extends StatelessWidget {
  const ButtonCartOff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.unselectColor),
      ),
      child: Text(
        context.localizations.checkout,
        style: context.theme.textTheme.subtitle1!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
