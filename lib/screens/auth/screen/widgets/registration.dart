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

class Registration extends StatelessWidget {
  const Registration({
    Key? key,
    required this.onSavedUsername,
    required this.onSavedEmail,
    required this.onSavedPassword,
    required this.isVisible,
    required this.onShow,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);
  final ValueChanged<String?> onSavedUsername;
  final ValueChanged<String?> onSavedEmail;
  final ValueChanged<String?> onSavedPassword;

  final ValueChanged<bool> onShow;
  final VoidCallback? onPressed;

  final bool isVisible;
  final bool isLoading;
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
                UsernameInput(onSavedUsernameLogin: onSavedUsername),
                const SizedBox(height: _kHeight),
                SingUpEmail(onSavedEmail: onSavedEmail),
                const SizedBox(height: _kHeight),
                PasswordInput(
                  checkPassword: onSavedPassword,
                  isVisible: isVisible,
                  onShow: onShow,
                ),
                const Spacer(),
                _SignUpButton(onPressed: onPressed),
                const SizedBox(height: _kHeightDownSizeBox),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingUpEmail extends StatelessWidget {
  const SingUpEmail({
    Key? key,
    required this.onSavedEmail,
  }) : super(key: key);

  final ValueChanged<String?> onSavedEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          validateEmail(value, context.localizations.enterAValidEmail),
      onSaved: onSavedEmail,
      decoration: InputDecoration(
        labelText: context.localizations.emailAddress,
      ),
    );
  }

  String? validateEmail(String? value, String error) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return error;
    }
    return null;
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
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
          context.localizations.signUpAuth,
          style: context.theme.textTheme.subtitle1!.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
