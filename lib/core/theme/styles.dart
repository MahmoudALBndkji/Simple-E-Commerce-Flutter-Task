import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle font32WhiteBold(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Colors.white,
    );
  }

  static TextStyle font32WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.white,
    );
  }

  static TextStyle font24SimilarWhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font24SimilarBlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font24SimilarWhiteLight(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font24WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.white,
    );
  }

  static TextStyle font24SimilarBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff252525),
    );
  }

  static TextStyle font20SimilarBlac2kBold(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font20SimilarBlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff2E3139),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font20WhiteBold(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: whiteColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font20PrimaryBold(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16SimilarBlac2kBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff282828),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.white,
    );
  }

  static TextStyle font16PrimaryBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: primaryColor,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16WhiteBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Colors.white,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16SimilarBlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16SimilarBlack2Regular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16SecondaryLight(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: secondaryColor,
    );
  }

  static TextStyle font16SimilarNavyRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff425583),
    );
  }

  static TextStyle font16BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff000000),
    );
  }

  static TextStyle font16SimilarWhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font16SimilarWhiteLight(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font16BlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff000000),
    );
  }

  static TextStyle font16RedRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffFF1D25),
    );
  }

  static TextStyle font16SimilarGreyBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xffA0A0A0),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font16SimilarGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff4D4D4D),
    );
  }

  static TextStyle font16SimilarGreyLight(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff4D4D4D),
    );
  }

  static TextStyle font16SimilarBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff262323),
    );
  }

  static TextStyle font16NunitoGrey(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: currentLangAr() ? "ibmMedium500" : "nunitoMedium500",
      color: Color.fromRGBO(37, 37, 37, 0.6),
    );
  }

  static TextStyle font15SimilarGreyLight(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      wordSpacing: 3,
      color: Color.fromARGB(255, 102, 102, 102),
    );
  }

  static TextStyle font15SimilarBlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      wordSpacing: 3,
      color: Color(0xff252525),
    );
  }

  static TextStyle font14SecondaryMedium(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmMedium500" : "nunitoMedium500",
      color: secondaryColor,
    );
  }

  static TextStyle font14SimilarLightBlueRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff425583),
    );
  }

  static TextStyle font14SimilarBlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font14BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.black,
    );
  }

  static TextStyle font14SimilarLightBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff1A1A1A),
    );
  }

  static TextStyle font14SimilarGreyMedium(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmMedium500" : "nunitoMedium500",
      color: Color(0xff999999),
    );
  }

  static TextStyle font14GreyLight(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff333333),
    );
  }

  static TextStyle font14BlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Colors.black,
    );
  }

  static TextStyle font14SimilarBlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff252525),
    );
  }

  static TextStyle font14WhiteLight(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xffFFFFFF),
    );
  }

  static TextStyle font14GreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff808080),
    );
  }

  static TextStyle font14ErrorRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color.fromARGB(255, 180, 48, 48),
    );
  }

  static TextStyle font14SecondaryLight(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: secondaryColor,
    );
  }

  static TextStyle font14SimilarBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff2E3139),
    );
  }

  static TextStyle font14SimilarBlackRegular2(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff262323),
    );
  }

  static TextStyle font14SimilarBlackRegular3(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff252525),
    );
  }

  static TextStyle font14SimilarWhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffCCCCCC),
    );
  }

  static TextStyle font14SimilarWhiteRegular2(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font13WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.white,
    );
  }

  static TextStyle font13SimilarBlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmBold700" : "introBold700",
      color: Color(0xff252525),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle font13SimilarBlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff252525),
    );
  }

  static TextStyle font13SimilarBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff252525),
    );
  }

  static TextStyle font13BlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff000000),
    );
  }

  static TextStyle font13SimiarGreyLightWithLine(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      decoration: TextDecoration.lineThrough,
      color: Color(0xff979797),
    );
  }

  static TextStyle font12SimilarBlacRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff262323),
    );
  }

  static TextStyle font12WhiteRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.white,
    );
  }

  static TextStyle font12SimilarGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffCCCCCC),
    );
  }

  static TextStyle font12BlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Colors.black,
    );
  }

  static TextStyle font12SimilarBlackLight(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff262323),
    );
  }

  static TextStyle font12SimilarBlackLight2(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xff252525),
    );
  }

  static TextStyle font12SimilarBlackRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xff262323),
    );
  }

  static TextStyle font12SimilarGreyRegular2(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font12SimilarGreyLight(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: currentLangAr() ? "ibmLight300" : "introLight300",
      color: Color(0xffF2F2F2),
    );
  }

  static TextStyle font12NunitoGrey(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: "nunitoMedium500",
      color: Color(0xff999999),
    );
  }

  static TextStyle font12NunitoSimilarGrey(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: "nunitoMedium500",
      color: Color.fromRGBO(37, 37, 37, 0.6),
    );
  }

  static TextStyle font10SimilarGreyRegular(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      fontFamily: currentLangAr() ? "ibmRegular400" : "introRegular400",
      color: Color(0xffCCCCCC),
    );
  }
}
