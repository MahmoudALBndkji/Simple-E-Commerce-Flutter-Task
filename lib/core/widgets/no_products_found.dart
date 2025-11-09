import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';

class NoProductsFound extends StatelessWidget {
  const NoProductsFound({
    super.key,
    required this.message,
    this.widthImage,
    this.axisColumn = MainAxisAlignment.start,
  });
  final String message;
  final MainAxisAlignment axisColumn;
  final double? widthImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: axisColumn,
      spacing: 20.0,
      children: [
        Image.asset(
          AssetsImage.noData,
          width: widthImage ?? widthScreen(context) / 2,
        ),
        Text(
          message.tr(context),
          textAlign: TextAlign.center,
          style: TextStyles.font20SimilarBlackBold(context).copyWith(
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }
}
