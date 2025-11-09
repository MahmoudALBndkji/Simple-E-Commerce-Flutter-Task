import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/log/logger.dart';

String displayErrorMessage(String body, BuildContext context) {
  if (body.isEmpty) return "error".tr(context);

  try {
    final decoded = jsonDecode(body);
    if (decoded is Map) {
      for (var key in ["Message", "message", "error"]) {
        if (decoded[key] != null) {
          return decoded[key].toString();
        }
      }
    }
  } catch (e) {
    Logger.error("Error parsing response body: $e");
  }

  return body.toString();
}
