import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/design/size_config.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/settings/views/widgets/settings_view_body.dart';

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
    final languageCubit = context.read<LanguageCubit>();
    final isTableOrBigger =
        MediaQuery.sizeOf(context).width > SizeConfig.tablet;
    return isTableOrBigger
        ? Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Expanded(
                child: SettingsViewBody(
                  slidingAnimationSettings: slidingAnimationSettings,
                  languageCubit: languageCubit,
                  isTableOrBigger: isTableOrBigger,
                ),
              ),
              Expanded(child: SizedBox.shrink()),
            ],
          )
        : SettingsViewBody(
            slidingAnimationSettings: slidingAnimationSettings,
            languageCubit: languageCubit,
            isTableOrBigger: isTableOrBigger,
          );
  }
}
