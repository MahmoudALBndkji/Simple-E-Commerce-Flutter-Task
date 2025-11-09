import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({super.key, required this.logoSlidingAnimation});
  final Animation<Offset> logoSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: logoSlidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: logoSlidingAnimation,
          child: Image.asset(
            AssetsImage.logo,
            fit: BoxFit.contain,
            width: widthScreen(context) / 2,
            height: widthScreen(context) / 2,
          ),
        );
      },
    );
  }
}
