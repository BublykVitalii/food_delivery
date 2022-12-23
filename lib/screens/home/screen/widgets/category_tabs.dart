import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kPaddingLeft = 75.0;
const _kBorderSide = 3.0;
const _kIndicatorLength = 10.0;

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    return TabBar(
      padding: const EdgeInsets.only(left: _kPaddingLeft),
      labelStyle: context.theme.textTheme.subtitle2!,
      labelColor: AppColors.lightOrange,
      unselectedLabelColor: AppColors.tabColor,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: _kBorderSide,
          color: AppColors.lightOrange,
        ),
        insets: EdgeInsets.symmetric(horizontal: _kIndicatorLength),
      ),
      isScrollable: true,
      controller: _tabController,
      tabs: [
        Tab(text: localizations.foods),
        Tab(text: localizations.drinks),
        Tab(text: localizations.snacks),
        Tab(text: localizations.sauce),
        Tab(text: localizations.salads),
      ],
    );
  }
}
