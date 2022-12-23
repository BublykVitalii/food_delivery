import 'package:flutter/material.dart';

import 'package:food_delivery/infrastructure/theme/app_colors.dart';
import 'package:food_delivery/infrastructure/theme/theme_extension.dart';
import 'package:food_delivery/screens/auth/screen/widgets/password_input.dart';
import 'package:food_delivery/screens/auth/screen/widgets/username_input.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

// ---Parameters---
const _kPadding = 50.0;
const _kHeight = 20.0;
const _kHeightDownSizeBox = 40.0;

class SignIn extends StatelessWidget {
  const SignIn({
    Key? key,
    required this.onSavedUsernameLogin,
    required this.onSavedPasswordLogin,
    required this.onPressed,
    required this.isVisible,
    required this.onShow,
  }) : super(key: key);
  final ValueChanged<String?> onSavedUsernameLogin;
  final ValueChanged<String?> onSavedPasswordLogin;

  final bool isVisible;

  final ValueChanged<bool> onShow;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _kPadding,
        right: _kPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: _kHeight),
                UsernameInput(onSavedUsernameLogin: onSavedUsernameLogin),
                const SizedBox(height: _kHeight),
                PasswordInput(
                  checkPassword: onSavedPasswordLogin,
                  isVisible: isVisible,
                  onShow: onShow,
                ),
                const Spacer(),
                _LoginButton(
                  onPressed: onPressed,
                ),
                const SizedBox(height: _kHeightDownSizeBox),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.lightOrange),
        ),
        onPressed: onPressed,
        child: Text(
          context.localizations.login,
          style: context.theme.textTheme.subtitle1!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
