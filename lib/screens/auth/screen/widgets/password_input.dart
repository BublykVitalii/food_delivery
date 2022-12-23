import 'package:flutter/material.dart';

import 'package:food_delivery/utils/localization_extensions.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.checkPassword,
    required this.isVisible,
    required this.onShow,
  }) : super(key: key);

  final ValueChanged<String?> checkPassword;
  final bool isVisible;
  final ValueChanged<bool> onShow;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validatePasswordLogin(
          value, context.localizations.passwordIsNotWritten),
      onSaved: checkPassword,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: context.localizations.password,
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            onShow(isVisible);
          },
        ),
      ),
    );
  }

  String? validatePasswordLogin(String? value, String error) {
    if (value == null || value.trim().isEmpty) {
      return error;
    }
    return null;
  }
}
