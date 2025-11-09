import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

Widget textFieldLogin({
  required IconData icon,
  required String hintText,
  required bool isPassword,
  required BuildContext context,
  required TextEditingController controller,
}) {
  return Container(
    height: widthScreen(context) / 8,
    width: widthScreen(context) / 1.22,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: .05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black.withValues(alpha: .8)),
      obscureText: isPassword,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black.withValues(alpha: .7)),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText.tr(context),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withValues(alpha: .5),
        ),
      ),
    ),
  );
}
