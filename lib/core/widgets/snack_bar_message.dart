import 'package:flutter/material.dart';
import '../languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';

void customSnackBar({
  required BuildContext context,
  required String keyLanguage,
  bool isTranslate = true,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        backgroundColor: secondaryColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Text(
          isTranslate ? keyLanguage.tr(context) : keyLanguage,
          style: TextStyles.font16WhiteRegular(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
