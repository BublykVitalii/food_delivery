import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kHeight = 20.0;
const _kSize = 150.0;

class NotFoundFood extends StatelessWidget {
  const NotFoundFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: _kSize,
            color: AppColors.unselectColor,
          ),
          const SizedBox(height: _kHeight),
          Text(
            context.localizations.itemNotFound,
          ),
          const SizedBox(height: _kHeight),
          Text(
            context.localizations.trySearchingTheItemWith,
            style: context.theme.textTheme.bodyText1!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
