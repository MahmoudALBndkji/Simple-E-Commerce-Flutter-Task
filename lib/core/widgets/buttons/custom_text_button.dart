import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.borderRadius,
    this.fontSize,
    this.onPressed,
    this.height,
    this.width,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12.0),
                side: BorderSide(color: borderColor ?? blackColor, width: 1)),
          ),
          onPressed: onPressed,
          child: Text(
            text.tr(context),
            style: TextStyles.font14BlackSemiBold(context).copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ),
      );
}
