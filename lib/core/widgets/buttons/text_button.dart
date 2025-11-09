import 'package:flutter/material.dart';

Widget customTextButton({
  VoidCallback? function,
  String? text,
  isUpper = true,
  TextStyle? styleTextButton,
  Color colorButton = const Color(0xff006AAB),
  Color backcolorButton = Colors.black,
  bool showButtonStyle = false,
}) =>
    TextButton(
      style: showButtonStyle
          ? ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(backcolorButton),
            )
          : const ButtonStyle(),
      onPressed: function,
      child: Text(
        isUpper ? "$text".toUpperCase() : "$text",
        style: styleTextButton == null
            ? TextStyle(color: colorButton)
            : styleTextButton.copyWith(color: colorButton),
      ),
    );
