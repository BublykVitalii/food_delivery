import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/app_images.dart';
import 'package:food_delivery/screens/search/screen/cubit/search_cubit.dart';
import 'package:food_delivery/screens/search/screen/search_screen.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kRadius = 30.0;
const _kPadding = 50.0;

class SearchFood extends StatelessWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _kPadding,
        right: _kPadding,
        top: MediaQuery.of(context).size.height / 100 * 2,
      ),
      child: TextFormField(
        readOnly: false,
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        decoration: InputDecoration(
          prefixIcon: Image.asset(AppImages.search),
          hintText: context.localizations.search,
          filled: true,
          fillColor: AppColors.backButton,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.backButton),
            borderRadius: BorderRadius.circular(_kRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.backButton),
            borderRadius: BorderRadius.circular(_kRadius),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
      create: (context) => SearchCubit(),
      child: const SearchScreen(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
