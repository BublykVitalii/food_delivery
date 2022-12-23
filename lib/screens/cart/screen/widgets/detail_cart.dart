import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/app_images.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/screens/home/domaine/food.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kPaddingLeftRight = 40.0;
const _kPaddingTop = 50.0;
const _kSizedBoxWidth = 5.0;
const _kSizedBoxHeight = 20.0;
const _kSeparatorHeight = 14.0;
const _kSizedBoxWidthSpace = 15.0;
const _kHeightWidthIcon = 70.0;
const _kRadius = 40.0;
const _kHeightCart = 100.0;
const _kRadiusCart = 20.0;
const _kPaddingCart = 17.0;

class DetailCart extends StatelessWidget {
  const DetailCart({
    Key? key,
    required this.foods,
  }) : super(key: key);
  final List<Food> foods;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _kPaddingLeftRight,
        right: _kPaddingLeftRight,
        top: _kPaddingTop,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.swipe_left_outlined),
              const SizedBox(width: _kSizedBoxWidth),
              Text(
                context.localizations.swipeOnAnItemToDelete,
                style: context.theme.textTheme.overline!,
              ),
            ],
          ),
          const SizedBox(height: _kSizedBoxHeight),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: AppColors.mediumGrey,
                  height: _kSeparatorHeight,
                ),
                itemCount: foods.length,
                itemBuilder: (BuildContext context, int index) {
                  final food = foods[index];
                  return CartFood(food: food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartFood extends StatelessWidget {
  const CartFood({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        children: [
          const SizedBox(width: _kSizedBoxWidthSpace),
          Container(
            height: _kHeightWidthIcon,
            width: _kHeightWidthIcon,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(_kRadius),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.heart,
              ),
            ),
          ),
          const SizedBox(width: _kSizedBoxWidthSpace),
          Container(
            height: _kHeightWidthIcon,
            width: _kHeightWidthIcon,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(_kRadius),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.trash,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        height: _kHeightCart,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(_kRadiusCart),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: _kPaddingCart),
              child: Container(
                height: _kHeightWidthIcon,
                width: _kHeightWidthIcon,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(_kRadius),
                  ),
                ),
                // image: DecorationImage(
                //   image: NetworkImage(image),
                // ),
              ),
            ),

            // child: Image.asset(
            //   AppImages.backgroundPeople,
            //   height: 70,
            //   width: 70,
            // ),
            const SizedBox(width: _kSizedBoxHeight),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name ?? 'no name',
                  style: context.theme.textTheme.subtitle1!,
                ),
                const SizedBox(height: 10),
                Text(
                  '₴${food.price}',
                  style: context.theme.textTheme.headline6!,
                ),
              ],
            ),
            const SizedBox(width: _kSizedBoxHeight),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.backOrange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_kRadiusCart),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1',
                        style: context.theme.textTheme.caption!,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
