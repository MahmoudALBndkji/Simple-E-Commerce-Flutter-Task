import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class RowCartItemInfo extends StatelessWidget {
  final String title, value;
  const RowCartItemInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title : ",
          style: TextStyles.font14BlueRegular(context),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
