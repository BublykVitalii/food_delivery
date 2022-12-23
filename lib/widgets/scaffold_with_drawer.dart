import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/app_images.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/screens/auth/domain/auth_service.dart';
import 'package:food_delivery/screens/cart/screen/cart_screen.dart';
import 'package:food_delivery/screens/on_boarding/on_boarding_screen.dart';
import 'package:food_delivery/utils/localization_extensions.dart';
import 'package:food_delivery/widgets/bottom_nav_bar.dart';
import 'package:get_it/get_it.dart';

class ScaffoldWithDrawer extends StatefulWidget {
  final Widget body;
  final bool withBottomNavBar;

  const ScaffoldWithDrawer({
    required this.body,
    this.withBottomNavBar = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ScaffoldWithDrawer> createState() => _ScaffoldWithDrawerState();
}

class _ScaffoldWithDrawerState extends State<ScaffoldWithDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();
  final AuthService authService = GetIt.instance.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    final local = context.localizations;

    return AdvancedDrawer(
      openRatio: 0.6,
      backdropColor: AppColors.lightOrange,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Scaffold(
        backgroundColor: AppColors.mediumGrey,
        appBar: AppBar(
          leadingWidth: 120,
          toolbarHeight: 70,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, CartScreen.route);
              },
              icon: Image.asset(AppImages.shopCardIcon),
            ),
            const SizedBox(width: 40),
          ],
          backgroundColor: AppColors.mediumGrey,
          elevation: 0,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return const AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(Icons.menu),
                );
              },
            ),
          ),
        ),
        body: widget.withBottomNavBar
            ? Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.mediumGrey,
                    child: widget.body,
                  ),
                  const BottomNavBar(),
                ],
              )
            : widget.body,
      ),
      drawer: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            children: [
              const Spacer(),
              _DrawerItems(
                onTap: () {},
                icon: AppImages.profileIcon,
                title: local.profile,
              ),
              _DrawerItems(
                onTap: () {},
                icon: AppImages.ordersIcon,
                title: local.orders,
              ),
              _DrawerItems(
                onTap: () {},
                icon: AppImages.offerPromoIcon,
                title: local.offerAndPromo,
              ),
              _DrawerItems(
                onTap: () {},
                icon: AppImages.privacyIcon,
                title: local.privacyPolicy,
              ),
              _DrawerItems(
                onTap: () {},
                icon: AppImages.securityIcon,
                title: local.security,
                isLast: true,
              ),
              const Spacer(
                flex: 3,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      authService.logOut();
                      Navigator.pushReplacement(
                          context, OnBoardingScreen.route);
                    },
                    child: Text(
                      local.signOut,
                      style: context.theme.textTheme.caption,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Image.asset(AppImages.rightArrowIcon)
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class _DrawerItems extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isLast;
  const _DrawerItems(
      {required this.onTap,
      required this.title,
      required this.icon,
      this.isLast = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(icon),
              const SizedBox(width: 12),
              Text(
                title,
                style: context.theme.textTheme.caption,
              ),
            ],
          ),
          if (!isLast) ...[
            const SizedBox(height: 26),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: SizedBox(
                width: 132,
                child: Divider(
                  height: 0.3,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 26),
          ],
        ],
      ),
    );
  }
}
