import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';

double imageDimensions(BuildContext context) {
  switch (widthScreen(context)) {
    case < 700:
      return widthScreen(context) / 2.5;
    case < 1200:
      return widthScreen(context) / 5;
    default:
      return widthScreen(context) / 5;
  }
}
