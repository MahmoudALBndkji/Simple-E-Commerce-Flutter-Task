import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard(
      {super.key, required this.text, required this.function});
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 11.0),
        height: 71.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withValues(alpha: 0.25),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  text.tr(context),
                  style: TextStyles.font20BlackRegular(context),
                ),
                const SizedBox(width: 10.0),
                Icon(
                  Icons.translate,
                  color: primaryColor,
                )
              ],
            ),
            const Icon(Icons.arrow_right_outlined, size: 35.0),
          ],
        ),
      ),
    );
  }
}
