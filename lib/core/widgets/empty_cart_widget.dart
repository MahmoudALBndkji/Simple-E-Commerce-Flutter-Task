import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
    required this.message,
    this.axisColumn = MainAxisAlignment.start,
  });
  final String message;
  final MainAxisAlignment axisColumn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: axisColumn,
      spacing: 20.0,
      children: [
        Image.asset(
          AssetsImage.emptyCart,
          width: 100.0,
          height: 100.0,
        ),
        Text(
          message.tr(context),
          textAlign: TextAlign.center,
          style: TextStyles.font20PrimaryBold(context).copyWith(
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }
}
