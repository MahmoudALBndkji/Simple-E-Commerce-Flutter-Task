import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:simple_ecommerce_flutter_task/core/constants/status_code.dart';
import 'strings.dart';
import '../languages/app_localizations.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromHttpException(http.ClientException e) {
    if (e is SocketException) {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.OfflineFailure
          : ErrorMessageEnglish.OfflineFailure);
    } else if (e is TimeoutException) {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.TimeoutFailure
          : ErrorMessageEnglish.TimeoutFailure);
    } else {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.GeneralFailure
          : ErrorMessageEnglish.GeneralFailure);
    }
  }
  factory ServerFailure.fromResponse(http.Response response) {
    switch (response.statusCode) {
      case StatusCode.BAD_REQUEST:
      case StatusCode.UNAUTHORIZED_USER:
      case StatusCode.UNKNOWN_ERROR:
        final jsonResponse = json.decode(response.body);
        return ServerFailure(jsonResponse['error']['message']);
      case StatusCode.NOT_FOUND:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.NotFoundFailure
            : ErrorMessageEnglish.NotFoundFailure);
      case StatusCode.SERVER_ERROR:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.InteralServerFailure
            : ErrorMessageEnglish.InteralServerFailure);
      default:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.GeneralFailure
            : ErrorMessageEnglish.GeneralFailure);
    }
  }
}

class OfflineFailure extends Failure {
  OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.message);
}
