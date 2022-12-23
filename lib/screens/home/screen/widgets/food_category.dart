import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/screens/food_details/screen/food_details.dart';

import 'package:food_delivery/screens/home/domaine/food.dart';

// ---Parameters---
const _kPadding = 50.0;
const _kCartFoodHeight = 320.0;
const _kCartFoodWidth = 220.0;
const _kBackCartBottom = 0.0;
const _kBackCartHeight = 270.0;
const _kCartImageLeftRight = 28.0;
const _kCartImageTop = 0.0;
const _kImageHeightWidth = 164.0;
const _kRadiusCart = Radius.circular(30);
const _kRadiusImage = Radius.circular(100);
const _kTextLeftRight = 24.0;
const _kTextBottom = 37.0;
const _kSizedBoxTextHeight = 14.0;

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    Key? key,
    required this.food,
    required this.isLoading,
  }) : super(key: key);

  final Food food;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: AppColors.lightOrange,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 90 * 6,
        left: _kPadding,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, FoodDetails.getRoute(food));
        },
        child: Hero(
          tag: food.id.toString(),
          child: Row(
            children: [
              SizedBox(
                height: _kCartFoodHeight,
                width: _kCartFoodWidth,
                child: Stack(
                  children: [
                    const _BackgroundCart(),
                    _ImageFood(image: food.photo ?? ''),
                    _NameFoodPrice(
                      nameFood: food.name ?? '',
                      priceFood: food.price ?? '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundCart extends StatelessWidget {
  const _BackgroundCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _kBackCartBottom,
      child: Container(
        height: _kBackCartHeight,
        width: _kCartFoodWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(_kRadiusCart),
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ImageFood extends StatelessWidget {
  const _ImageFood({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _kCartImageLeftRight,
      right: _kCartImageLeftRight,
      top: _kCartImageTop,
      child: Container(
        height: _kImageHeightWidth,
        width: _kImageHeightWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(_kRadiusImage),
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}

class _NameFoodPrice extends StatelessWidget {
  const _NameFoodPrice({
    Key? key,
    required this.nameFood,
    required this.priceFood,
  }) : super(key: key);

  final String nameFood;
  final String priceFood;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _kTextLeftRight,
      right: _kTextLeftRight,
      bottom: _kTextBottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameFood,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: _kSizedBoxTextHeight),
          Text(priceFood),
        ],
      ),
    );
  }
}
