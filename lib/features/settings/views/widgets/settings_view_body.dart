import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_reveal_provider.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/navigation.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/add_product_to_store_view.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/settings_card_item.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/settings_divider.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({
    super.key,
    required this.slidingAnimationSettings,
    required this.languageCubit,
    required this.isTableOrBigger,
  });

  final Animation<Offset> slidingAnimationSettings;
  final LanguageCubit languageCubit;
  final bool isTableOrBigger;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 19.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 80,
                  color: primaryColor.withValues(alpha: 0.75),
                ),
              ),
              FutureBuilder<String?>(
                future: CacheHelper.instance.read(key: "username"),
                builder: (context, snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    snapshot.data!,
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                },
              ),
              const SizedBox(height: 30.0),
              AnimatedBuilder(
                animation: slidingAnimationSettings,
                builder: (context, child) => SlideTransition(
                  position: slidingAnimationSettings,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.5),
                          width: 1.5),
                    ),
                    child: Column(
                      children: [
                        SettingsCardItem(
                          icon: Icons.flag,
                          title: "change_lanuage",
                          onTap: () => languageCubit.changeLanguage(
                            currentLangAr() ? "en" : "ar",
                          ),
                        ),
                        if (!isTableOrBigger) ...{
                          settingsDivider(),
                          SettingsCardItem(
                            icon: Icons.color_lens_outlined,
                            title: "change_theme",
                            onTap: () =>
                                ThemeRevealProvider.of(context)!.reveal(),
                          ),
                        },
                        settingsDivider(),
                        SettingsCardItem(
                          icon: Icons.add_circle_outline,
                          title: "add_product_to_store",
                          onTap: () => Navigator.push(
                            context,
                            SizeTransitionToBottom(
                              AddProductToStoreView(),
                            ),
                          ),
                        ),
                        settingsDivider(),
                        SettingsCardItem(
                          icon: Icons.logout_outlined,
                          title: "logout",
                          onTap: () async {
                            await CacheHelper.instance.deleteAll();
                            navigateAndRemoveUntil(
                                context, const LoginLayout());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
