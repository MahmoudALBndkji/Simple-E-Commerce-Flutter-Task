import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/status_code.dart';
import 'package:simple_ecommerce_flutter_task/core/network/check_is_success.dart';

void main() {
  group('checkReqIsSuccess', () {
    test('returns true for success codes', () {
      expect(checkReqIsSuccess(StatusCode.SUCCESS), isTrue);
      expect(checkReqIsSuccess(StatusCode.SUCCESS_WITH_RESULT), isTrue);
      expect(checkReqIsSuccess(StatusCode.SUCCESS_NO_CONTENT), isTrue);
    });

    test('returns false for error codes', () {
      expect(checkReqIsSuccess(StatusCode.BAD_REQUEST), isFalse);
      expect(checkReqIsSuccess(StatusCode.UNAUTHORIZED_USER), isFalse);
      expect(checkReqIsSuccess(StatusCode.SERVER_ERROR), isFalse);
      expect(checkReqIsSuccess(StatusCode.NETWORK_ERROR), isFalse);
    });
  });
}


