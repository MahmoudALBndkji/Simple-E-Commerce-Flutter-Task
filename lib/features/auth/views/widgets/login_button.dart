import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/logo_animation_loading.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/navigation.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/snack_bar_message.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/view_model/authentication_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/widgets/auth_button.dart';
import 'package:simple_ecommerce_flutter_task/features/home/layout/home_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const LogoAnimationLoading(colorText: Colors.white);
            },
          );
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          QuickAlert.show(
            barrierDismissible: false,
            context: context,
            type: QuickAlertType.error,
            title: "error".tr(context),
            confirmBtnText: "done".tr(context),
            text: state.errorMessage,
            animType: QuickAlertAnimType.slideInDown,
          );
        } else if (state is LoginSucessState) {
          Navigator.pop(context);
          customSnackBar(context: context, keyLanguage: "operation_success");
          navigateAndRemoveUntil(
            context,
            BlocProvider(
              create: (context) => HomeCubit(service: ApiService()),
              child: const HomeLayout(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: authButton('login', 2.5, () async {
            if (formKey.currentState!.validate()) {
              HapticFeedback.lightImpact();
              BlocProvider.of<AuthenticationCubit>(context).userLogin(
                context: context,
                username: usernameController.text,
                password: passwordController.text,
              );
            }
          }, context),
        );
      },
    );
  }
}
