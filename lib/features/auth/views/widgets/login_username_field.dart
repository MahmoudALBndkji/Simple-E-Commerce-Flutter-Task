import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/text_field_with_title.dart';

class LoginUserNameField extends StatelessWidget {
  const LoginUserNameField({super.key, required this.usernameController});
  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithTitle(
      controller: usernameController,
      title: "username".tr(context),
      hint: "enter_username".tr(context),
      validator: (input) =>
          input!.isEmpty ? "username_validation".tr(context) : null,
    );
  }
}
