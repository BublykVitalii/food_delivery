import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({
    Key? key,
    required this.inputValue,
  }) : super(key: key);
  final ValueChanged<String?> inputValue;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mediumGrey,
      elevation: 0,
      title: TextFormField(
        onChanged: inputValue,
        decoration: InputDecoration(
          hintText: context.localizations.writeTheNameOf,
          icon: const Icon(Icons.search),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
