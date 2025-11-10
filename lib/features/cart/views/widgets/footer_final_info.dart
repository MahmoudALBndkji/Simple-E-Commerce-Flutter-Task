import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/regexp.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/views/widgets/cart_row_order_value.dart';

class FooterFinalInfo extends StatelessWidget {
  const FooterFinalInfo({
    super.key,
    required this.hCubit,
    this.withDivider = true,
  });
  final HomeCubit hCubit;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "payment_summary".tr(context),
            style: TextStyles.font20PrimaryBold(context),
          ),
        ),
        const SizedBox(height: 7.0),
        CartRowOrderValue(
          changeCustomStyle: true,
          customTextStyle: Theme.of(context).textTheme.bodyMedium,
          title: 'numbers_of_products'.tr(context),
          value: '${hCubit.products.length}',
        ),
        const SizedBox(height: 7.0),
        CartRowOrderValue(
          changeCustomStyle: true,
          customTextStyle: Theme.of(context).textTheme.bodyMedium,
          title: 'total_amount'.tr(context),
          value: splitPriceByCommaDouble(hCubit.getTotalPrice()),
        ),
      ],
    );
  }
}
