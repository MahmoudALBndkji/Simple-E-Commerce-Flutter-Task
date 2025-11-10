import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class AddProductToStoreAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddProductToStoreAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: true,
      title: Text(
        "add_product_to_store".tr(context),
        style: TextStyles.font24TextGreyBold(context)
            .copyWith(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
