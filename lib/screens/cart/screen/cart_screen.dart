import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/cart/screen/cubit/cart_cubit.dart';
import 'package:food_delivery/screens/cart/screen/widgets/button_cart.dart';
import 'package:food_delivery/screens/cart/screen/widgets/button_cart_off.dart';
import 'package:food_delivery/screens/cart/screen/widgets/cart_is_empty.dart';

import 'package:food_delivery/utils/localization_extensions.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';

import 'package:food_delivery/screens/cart/screen/widgets/detail_cart.dart';

class CartScreen extends StatefulWidget {
  static const _routeName = '/cart-screen';

  static PageRoute<CartScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return BlocProvider(
          create: (context) => CartCubit(),
          child: const CartScreen(),
        );
      },
    );
  }

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.localizations.cart,
              style: context.theme.textTheme.subtitle1!,
            ),
            elevation: 0,
            backgroundColor: AppColors.mediumGrey,
          ),
          body: state.foods.isEmpty
              ? const CartIsEmpty()
              : DetailCart(foods: state.foods),
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: state.foods.isEmpty
                  ? const ButtonCartOff()
                  : const ButtonCart(),
            ),
          ),
        );
      },
    );
  }
}
