import 'package:flutter/material.dart';
import 'package:food_delivery/utils/localization_extensions.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    Key? key,
    required this.onSavedUsernameLogin,
  }) : super(key: key);

  final ValueChanged<String?> onSavedUsernameLogin;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          validateLogin(value, context.localizations.usernameIsNotWritten),
      onSaved: onSavedUsernameLogin,
      decoration: InputDecoration(
        labelText: context.localizations.username,
      ),
    );
  }

  String? validateLogin(String? value, String error) {
    if (value == null || value.trim().isEmpty) {
      return error;
    }
    return null;
  }
}
