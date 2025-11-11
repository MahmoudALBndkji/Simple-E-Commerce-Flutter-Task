import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/design/image_dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';

class SplashSlidingLogo extends StatelessWidget {
  const SplashSlidingLogo({
    super.key,
    required double containerOpacity,
    required double containerSize,
  })  : _containerOpacity = containerOpacity,
        _containerSize = containerSize;

  final double _containerOpacity;
  final double _containerSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
        opacity: _containerOpacity,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: widthScreen(context) / _containerSize,
          width: widthScreen(context) / _containerSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AssetsImage.logo,
              width: imageDimensions(context),
            ),
          ),
        ),
      ),
    );
  }
}
