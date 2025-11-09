import 'package:flutter/material.dart';
import '../languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';

class Unavaliable extends StatelessWidget {
  const Unavaliable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 4,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            Image.asset(
              AssetsImage.notFound,
              width: widthScreen(context) / 2,
            ),
            const SizedBox(height: 20.0),
            Text(
              "unavailable_at_moment".tr(context),
              textAlign: TextAlign.center,
              style: TextStyles.font20PrimaryBold(context),
            )
          ],
        ),
      ),
    );
  }
}
