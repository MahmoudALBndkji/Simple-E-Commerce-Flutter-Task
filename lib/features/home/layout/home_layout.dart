import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/design/size_config.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/circular_clipper.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_reveal_provider.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/bottom_nav_bar/custom_bottom_navigation_bar.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/home_desktop_appbar.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/drawer/home_desktop_drawer.dart';
import 'package:simple_ecommerce_flutter_task/features/home/widgets/home_mobile_appbar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  late AnimationController _clipController;
  late Animation<double> _radiusAnimation;
  Color? _backgroundBefore;
  Color? _backgroundAfter;

  @override
  void initState() {
    super.initState();
    final themeState = context.read<ThemeCubit>().state;
    _backgroundBefore = themeState is ThemeDark ? Colors.black : Colors.white;
    _clipController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _radiusAnimation = Tween<double>(begin: 0, end: 1000).animate(
      CurvedAnimation(parent: _clipController, curve: Curves.ease),
    )..addListener(() => setState(() {}));
  }

  void _animateThemeChange(BuildContext context) async {
    await _clipController.reverse();
    final themeCubit = context.read<ThemeCubit>();
    themeCubit.toggleTheme();
    final newTheme = themeCubit.state;
    _backgroundAfter = newTheme is ThemeDark ? Colors.black : Colors.white;
    _clipController.forward();
  }

  @override
  void dispose() {
    _clipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final isTableOrBigger =
            MediaQuery.sizeOf(context).width > SizeConfig.tablet;
        return ThemeRevealProvider(
          reveal: () => _animateThemeChange(context),
          child: Scaffold(
            appBar: isTableOrBigger
                ? HomeDesktopAppbar(
                    onThemePressed: () => _animateThemeChange(context))
                : HomeMobileAppbar(
                    onThemePressed: () => _animateThemeChange(context)),
            backgroundColor: _backgroundBefore,
            drawer: isTableOrBigger ? HomeDesktopDrawer() : null,
            body: Stack(
              children: [
                Container(color: _backgroundBefore),
                ClipPath(
                  clipper: CircularClipper(
                    centerX: width,
                    centerY: 0,
                    radius: _radiusAnimation.value,
                  ),
                  child: Container(color: _backgroundAfter),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final HomeCubit hCubit = HomeCubit.get(context);
                    return SafeArea(child: hCubit.screens[hCubit.screenIndex]);
                  },
                ),
              ],
            ),
            bottomNavigationBar:
                isTableOrBigger ? null : customBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
