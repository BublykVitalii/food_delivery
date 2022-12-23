import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';

import 'package:food_delivery/screens/home/domaine/food.dart';

// ---Parameters---
const _kCartFoodHeight = 320.0;
const _kCartFoodWidth = 190.0;
const _kBackCartBottom = 0.0;
const _kBackCartHeight = 270.0;
const _kCartImageLeftRight = 28.0;
const _kCartImageTop = 0.0;
const _kImageHeightWidth = 160.0;
const _kRadiusCart = Radius.circular(30);
const _kRadiusImage = Radius.circular(100);
const _kTextLeftRight = 24.0;
const _kTextBottom = 37.0;
const _kSizedBoxTextHeight = 14.0;
const _kSizedBoxHeight = 30.0;
const _kPadding = 20.0;
const _kPaddingVertical = 10.0;
const _kCrossAxisCount = 2;
const _kMainAxisSpacing = 10.0;
const _kCrossAxisSpacing = 10.0;

class FoodDetail extends StatelessWidget {
  const FoodDetail({
    Key? key,
    required this.foods,
  }) : super(key: key);
  final List<Food> foods;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: _kSizedBoxHeight),
        Text(
          'Found  ${foods.length} results',
          style: context.theme.textTheme.headline3!,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(_kPadding),
            child: MasonryGridView.count(
              padding: const EdgeInsets.symmetric(vertical: _kPaddingVertical),
              crossAxisCount: _kCrossAxisCount,
              mainAxisSpacing: _kMainAxisSpacing,
              crossAxisSpacing: _kCrossAxisSpacing,
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return FoodCard(
                  index: index,
                  food: food,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.food,
    required this.index,
  }) : super(key: key);

  final Food food;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 50),
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
