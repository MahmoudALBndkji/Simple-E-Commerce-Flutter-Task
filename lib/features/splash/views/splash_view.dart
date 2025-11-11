import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/layout/home_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/widgets/splash_page_transition.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/widgets/splash_sliding_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.1;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () async {
      bool userIsLoggedIn =
          await CacheHelper.instance.read(key: 'isLogin') == 'true';
      setState(() {
        Navigator.pushReplacement(
            context,
            SplashPageTransition(
              userIsLoggedIn
                  ? BlocProvider(
                      create: (context) => HomeCubit(service: ApiService()),
                      child: const HomeLayout(),
                    )
                  : const LoginLayout(),
            ));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: heightScreen(context) / _fontSize,
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'Simple E-Commerce App',
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          SplashSlidingLogo(
            containerOpacity: _containerOpacity,
            containerSize: _containerSize,
          ),
        ],
      ),
    );
  }
}
