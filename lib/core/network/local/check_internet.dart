
import 'dart:io';

Future<bool> checkInternetStatus() async {
  try {
    final result = await InternetAddress.lookup("www.google.com");
    // final result = await InternetAddress.lookup("localhost");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    return false;
  } on SocketException catch (_) {
    return false;
  }
}
