import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(),
    );
  }
}
