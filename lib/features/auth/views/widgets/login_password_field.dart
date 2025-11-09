import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/text_field_with_title.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/view_model/authentication_cubit.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit authCubit = AuthenticationCubit.get(context);
        return TextFieldWithTitle(
          minLines: 1,
          maxLines: 1,
          controller: passwordController,
          title: "password".tr(context),
          hint: "enter_password".tr(context),
          validator: (input) =>
              input!.isEmpty ? "password_validation".tr(context) : null,
          obscureText: authCubit.isPassword,
          suffixIcon: IconButton(
            icon: Icon(
              authCubit.isPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => authCubit.changeVisiblePassword(),
          ),
        );
      },
    );
  }
}
