import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class CustomTextButtonWithIcon extends StatelessWidget {
  const CustomTextButtonWithIcon({
    super.key,
    required this.bgColor,
    required this.iconColor,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.onPressed,
  });

  final Color bgColor, iconColor, textColor;
  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bgColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      icon: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
      label: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style:
              TextStyles.font16WhiteRegular(context).copyWith(color: textColor),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
