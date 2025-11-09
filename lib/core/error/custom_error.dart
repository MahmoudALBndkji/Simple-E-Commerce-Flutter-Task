import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../utils/assets.dart';

customError() {
  return ErrorWidget.builder = ((details) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Expanded(
              flex: 2,
              child: Image.asset(
                AssetsImage.notFound,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "هناك خطأ ما",
                  // if you want to show main message error cancel comment below
                  // details.exception.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
