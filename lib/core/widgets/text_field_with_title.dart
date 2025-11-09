import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.initalValue,
    this.validator,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLines,
    this.textInputAction,
    this.minLines,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
  });
  final String title, hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText, readOnly;
  final Widget? suffixIcon, prefixIcon;
  final TextEditingController? controller;
  final Function(String?)? onChange;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines, maxLines;
  final String? initalValue;
  final bool enableInteractiveSelection;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14GreyLight(context),
        ),
        SizedBox(height: 6),
        TextFormField(
          focusNode: focusNode,
          textInputAction: textInputAction,
          style: TextStyles.font14SimilarLightBlackRegular(context),
          enableInteractiveSelection: enableInteractiveSelection,
          readOnly: readOnly,
          initialValue: initalValue,
          minLines: minLines,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          cursorColor: secondaryColor,
          onTap: onTap,
          onChanged: onChange,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            hintStyle: TextStyles.font14GreyRegular(context),
            labelStyle: TextStyles.font14SimilarLightBlackRegular(context),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(isFocus: true),
            errorStyle: TextStyles.font14ErrorRegular(context),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder({bool isFocus = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
          BorderSide(color: isFocus ? Color(0xff00BFFF) : Color(0xff808080)),
    );
  }
}
