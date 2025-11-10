import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/dimensions.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle font34BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 34),
      color: blackColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font32BlackExtraBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      color: Colors.black,
      fontWeight: FontWeightHelper.extraBold,
    );
  }

  static TextStyle font32BlueBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font30BlacksemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      color: Colors.black,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font30PrimarysemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      color: primaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font24TextGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font24BlueBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font24BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      color: blackColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font28PrimaryBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font24TextGreyBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      color: textGreyColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font21BlackSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 21),
      color: Colors.black,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font21BlueSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 21),
      color: primaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font21ItalicRegular(BuildContext context) {
    return TextStyle(fontSize: 21.0, fontStyle: FontStyle.italic);
  }

  static TextStyle font20BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: Colors.black,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font20WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: Colors.white,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font20PrimaryBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18BlackMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: Colors.black,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle font18TextColorBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: textColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18WhiteBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: whiteColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18BlueBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: Colors.black,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font18White(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: whiteColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18Secondary(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: secondaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: blackColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font18TextGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font17GreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16TextColorMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: textColor,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle font16WhiteBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: whiteColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16WhiteMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: Colors.white,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle font16BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: Colors.black,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16PrimaryRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: primaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16BlueRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: primaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16TextGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16WhiteSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: Colors.white,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font16PrimarySemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: primaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font16BlackSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: blackColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font16BlueSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: primaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font16SecondarySemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: secondaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font16BlackMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: Colors.black,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle font16WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: whiteColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16TextGrey(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font15BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: Colors.black,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font15DarkSecondaryMedium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: secondaryColor,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle font15DarkSecondaryRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: secondaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font14BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      color: blackColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font14TextGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font16ErrorBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: cancelledColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font14SecondaryRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      color: secondaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font14BlackSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      color: blackColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font14SecondarySemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      color: secondaryColor,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font14BlueSemiBold(BuildContext context) {
    return TextStyle(
      color: primaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font14WhiteSemiBold(BuildContext context) {
    return TextStyle(
      color: whiteColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font14BlueRegular(BuildContext context) {
    return TextStyle(
      color: primaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font13BlueSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle font13BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font13GreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      color: blackColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      color: whiteColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12PrimaryRegular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      color: primaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12Secondary(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      color: secondaryColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font12TextGrey(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      color: textGreyColor,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle font8BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      color: blackColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font7BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 7),
      color: blackColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font6BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 6),
      color: blackColor,
      fontWeight: FontWeightHelper.bold,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
