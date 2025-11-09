import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class LoginHeaderText extends StatelessWidget {
  const LoginHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'login'.tr(context),
        textAlign: TextAlign.center,
        style: TextStyles.font24BlueBold(context),
      ),
    );
  }
}
