import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/app_images.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kRadiusAppBar = Radius.circular(30);

class AppBarAuth extends StatelessWidget {
  const AppBarAuth({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: _kRadiusAppBar,
          bottomRight: _kRadiusAppBar,
        ),
      ),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: context.localizations.login),
          Tab(text: context.localizations.signUp),
        ],
      ),
      flexibleSpace: SafeArea(
        child: Image.asset(AppImages.logoAuth),
      ),
    );
  }
}
