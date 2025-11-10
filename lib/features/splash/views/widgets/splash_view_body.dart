import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/widgets/navigation.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_view.dart';
import 'package:simple_ecommerce_flutter_task/features/home/layout/home_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/widgets/sliding_logo.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController logoanimationController;
  late Animation<Offset> logoSlidingAnimation;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    executeNavigation();
  }

  @override
  void dispose() {
    super.dispose();
    logoanimationController.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(logoSlidingAnimation: logoSlidingAnimation),
        const SizedBox(height: 30.0),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    logoanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    logoSlidingAnimation = Tween<Offset>(
      begin: const Offset(-5, 0),
      end: Offset.zero,
    ).animate(logoanimationController);
    logoanimationController.forward();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void executeNavigation() async {
    bool userIsLoggedIn =
        await CacheHelper.instance.read(key: 'isLogin') == 'true';
    Future.delayed(const Duration(milliseconds: 2500), () {
      navigateReplacementTo(
        context,
        userIsLoggedIn
            ? BlocProvider(
                create: (context) => HomeCubit(),
                child: const HomeLayout(),
              )
            : const LoginView(),
      );
    });
  }
}
