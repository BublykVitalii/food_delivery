import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kHeight = 20.0;
const _kSize = 150.0;

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          const Icon(
            Icons.shopping_cart_outlined,
            size: _kSize,
            color: AppColors.unselectColor,
          ),
          const SizedBox(height: _kHeight),
          Text(context.localizations.cartIsEmpty),
          const SizedBox(height: _kHeight),
          Text(
            context.localizations.addNewItemsToCart,
            style: context.theme.textTheme.bodyText1!,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
