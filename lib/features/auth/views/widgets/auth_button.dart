import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

Widget authButton(
  String string,
  double width,
  VoidCallback voidCallback,
  BuildContext context,
) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: voidCallback,
    child: Container(
      height: widthScreen(context) / 9,
      width: widthScreen(context) / width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        string.tr(context),
        style: TextStyle(color: whiteColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
