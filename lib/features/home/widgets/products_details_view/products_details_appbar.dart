import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';

class ProductsDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductsDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: true,
      title: Text(
        "product_details".tr(context),
        style: TextStyles.font24TextGreyBold(context)
            .copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
