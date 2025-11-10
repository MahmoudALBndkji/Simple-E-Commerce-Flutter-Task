import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class CartRowOrderValue extends StatelessWidget {
  const CartRowOrderValue({
    super.key,
    required this.title,
    required this.value,
    this.changeCustomStyle = false,
    this.customTextStyle,
  });
  final String title;
  final String value;
  final TextStyle? customTextStyle;
  final bool changeCustomStyle;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: changeCustomStyle
                    ? customTextStyle
                    : TextStyles.font20BlackRegular(context)
                        .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: widthScreen(context) / 2),
              child: Text(value,
                  style: changeCustomStyle
                      ? customTextStyle
                      : TextStyles.font20BlackRegular(context)
                          .copyWith(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );
}
