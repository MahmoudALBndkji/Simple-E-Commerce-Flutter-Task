import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.height = 48,
    required this.text,
    this.fullWidth = true,
    this.buttonColor,
    this.textAlign,
    required this.function,
  });
  final bool fullWidth;
  final double height;
  final String text;
  final VoidCallback function;
  final Color? buttonColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: buttonColor ?? secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyles.font16WhiteRegular(context),
        ),
      ),
    );
  }
}
