import 'package:flutter/material.dart';
import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = context.localizations;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.mediumGrey,
          selectedItemColor: AppColors.backOrange,
          unselectedItemColor: const Color(0xFFADADAF),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 25,
              ),
              label: local.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite_outline,
                size: 24,
              ),
              label: local.favorite,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outlined,
                size: 24,
              ),
              label: local.profile,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.history,
                size: 29,
              ),
              label: local.history,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
