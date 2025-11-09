import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.fillColor,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final Color? fillColor;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () =>
          // Keep Cursor At End
          WidgetsBinding.instance.addPostFrameCallback(
        (_) => controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        ),
      ),
      cursorColor: primaryColor,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hint,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
