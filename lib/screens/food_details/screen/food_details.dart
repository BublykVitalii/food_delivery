import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/screens/cart/screen/cubit/cart_cubit.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';

import 'package:food_delivery/screens/food_details/screen/widgets/slider_image.dart';

// ---Parameters---
const _kElevation = 0.0;
const _kSizedBoxWidth = 50.0;
const _kPadding = 50.0;
const _kHeight = 20.0;
const _kSizedBoxHeight = 10.0;

class FoodDetails extends StatefulWidget {
  static const _routeName = '/food-detail';

  static PageRoute<FoodDetails> getRoute(Food food) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return FoodDetails(food: food);
      },
    );
  }

  final Food food;

  const FoodDetails({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  CartCubit get cartCubit => BlocProvider.of<CartCubit>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.mediumGrey,
        elevation: _kElevation,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          const SizedBox(width: _kSizedBoxWidth),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: _kPadding,
          right: _kPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderImage(food: widget.food),
            const SizedBox(height: _kHeight),
            TextFoodName(nameFood: widget.food.name ?? ''),
            TextPrice(price: widget.food.price ?? ''),
            const SizedBox(height: _kHeight),
            const TextDeliveryInfo(),
            const SizedBox(height: _kSizedBoxHeight),
            const TextDelivery(),
            const SizedBox(height: _kHeight),
            const TextReturn(),
            const SizedBox(height: _kSizedBoxHeight),
            const TextAllOurFoods(),
            const Spacer(),
            AddToCartButton(food: widget.food),
            const SizedBox(height: _kHeight),
          ],
        ),
      ),
    );
  }
}

class TextFoodName extends StatelessWidget {
  const TextFoodName({
    Key? key,
    required this.nameFood,
  }) : super(key: key);

  final String nameFood;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        nameFood,
        style: context.theme.textTheme.headline3,
      ),
    );
  }
}

class TextPrice extends StatelessWidget {
  const TextPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '₴$price',
        style: context.theme.textTheme.bodyText2!.copyWith(
          color: AppColors.lightOrange,
        ),
      ),
    );
  }
}

class TextDeliveryInfo extends StatelessWidget {
  const TextDeliveryInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.deliveryInfo,
      style: context.theme.textTheme.button,
    );
  }
}

class TextDelivery extends StatelessWidget {
  const TextDelivery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.deliveredBetweenMonday,
      style: context.theme.textTheme.overline!.copyWith(
        color: AppColors.lightGrey,
      ),
    );
  }
}

class TextReturn extends StatelessWidget {
  const TextReturn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.returnPolicy,
      style: context.theme.textTheme.button,
    );
  }
}

class TextAllOurFoods extends StatelessWidget {
  const TextAllOurFoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.allOurFoodsAreDoubleChecked,
      style: context.theme.textTheme.overline!.copyWith(
        color: AppColors.lightGrey,
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.lightOrange),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop(true);
                });
                return AlertDialog(
                  title: Text(context.localizations.addedToBasket),
                );
              });
        },
        child: Text(
          context.localizations.addToCart,
          style: context.theme.textTheme.subtitle1!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
