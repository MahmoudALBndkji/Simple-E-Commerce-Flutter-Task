import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/utils/assets.dart';

class AuthHeaderImage extends StatelessWidget {
  const AuthHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.asset(AssetsImage.logo, width: widthScreen(context) / 2.5),
      ),
    );
  }
}
