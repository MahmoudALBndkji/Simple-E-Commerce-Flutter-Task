import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktop = 1200;
  static const double tablet = 800;
  static late double width, height;
}

double heightScreen(context) => MediaQuery.sizeOf(context).height;

double widthScreen(context) => MediaQuery.sizeOf(context).width;
