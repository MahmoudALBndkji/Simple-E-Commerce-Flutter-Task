import 'package:simple_ecommerce_flutter_task/core/constants/status_code.dart';

bool checkReqIsSuccess(int statusCode) =>
    statusCode == StatusCode.SUCCESS ||
    statusCode == StatusCode.SUCCESS_WITH_RESULT ||
    statusCode == StatusCode.SUCCESS_NO_CONTENT;
