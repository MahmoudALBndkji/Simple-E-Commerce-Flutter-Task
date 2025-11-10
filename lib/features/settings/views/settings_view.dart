import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/navigation.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_view.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/settings_card_item.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/settings_divider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with TickerProviderStateMixin {
  late AnimationController animationControllerSettings;
  late Animation<Offset> slidingAnimationSettings;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    animationControllerSettings.dispose();
    super.dispose();
  }

  void initSlidingAnimation() {
    animationControllerSettings = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 650));
    slidingAnimationSettings = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(animationControllerSettings);
    animationControllerSettings.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final languageCubit = context.read<LanguageCubit>();
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
                        settingsDivider(),
                        SettingsCardItem(
                          icon: Icons.color_lens_outlined,
                          title: "change_theme",
                          onTap: () {
                            if (themeCubit.state is ThemeLight) {
                              themeCubit.setTheme(true);
                            } else {
                              themeCubit.setTheme(false);
                            }
                          },
                        ),
                        settingsDivider(),
                        SettingsCardItem(
                          icon: Icons.add_circle_outline,
                          title: "add_product_to_store",
                          onTap: () {},
                        ),
                        settingsDivider(),
                        SettingsCardItem(
                          icon: Icons.logout_outlined,
                          title: "logout",
                          onTap: () async {
                            await CacheHelper.instance.deleteAll();
                            navigateAndRemoveUntil(context, const LoginView());
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
