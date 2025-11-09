import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'dont_have_an_account'.tr(context),
              style: TextStyles.font18BlackBold(context),
            ),
            TextSpan(
              text: ' ${"register".tr(context)} ',
              style: TextStyles.font16PrimarySemiBold(context),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
