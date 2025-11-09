import 'package:flutter/material.dart';

class RemoteConstants {
  static const String BASE_URL = "https://fakestoreapi.com";
}

class Endpoints {
  static const String userLogin = 'auth/login';
  static const String getAllProducts = 'products';
  static const String addNewProduct = 'products';
  static const String getProduct = 'products';
}

class StatusCodes {
  static const SUCCESS = 200;
  static const SUCCESS_WITH_RESULT = 201;
  static const BAD_REQUEST = 400;
  static const UNAUTHORIZED_USER = 401;
  static const UNKNOWN_ERROR = 402;
  static const NOT_FOUND = 404;
  static const UNVERIFIED_ACCOUNT = 406;
  static const EXPIRED_TOKEN = 434;
  static const MUST_LOGIN_AGAIN = 436;
  static const SERVER_ERROR = 500;
  static const NETWORK_ERROR = 0;
}

Color primaryColor = const Color(0xFF3884C2);
Color secondaryColor = const Color(0xFF00BFFF);
Color backgroundWidgetColor = const Color(0xFF133B5F);
Color textColor = const Color.fromRGBO(99, 116, 125, 1);
Color thirdColor = const Color(0xff2D2D2D);
Color textGreyColor = const Color(0xff757D80);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color loadingTextColor = Color(0xff1E385D);
Color backgroundLayout = const Color(0xffF5F5F5);
Color custombackgroundContainer = const Color(0xffffffff);
Color cancelledColor = const Color(0xffDB4437);
Color successColor = const Color(0xff09AA29);

// Full Size Dimensions

double heightScreen(context) => MediaQuery.sizeOf(context).height;

double widthScreen(context) => MediaQuery.sizeOf(context).width;
