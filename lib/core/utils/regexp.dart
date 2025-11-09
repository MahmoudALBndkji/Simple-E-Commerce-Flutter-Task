extension EmailValidator on String {
  bool isEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

// For Check The Text Should Least 6 Characters
bool isLeast6Characters(String originalText) {
  return RegExp(r'^.{6,}$').hasMatch(originalText);
}

// For Check The Text Should Least 3 Characters
bool isLeast3Characters(String originalText) {
  return RegExp(r'^.{3,}$').hasMatch(originalText);
}

String splitPriceByCommaNumber(int number) {
  String str = number.toString();
  int length = str.length;
  if (length <= 3) return str;
  int firstCommaIndex = length % 3;
  if (firstCommaIndex == 0) firstCommaIndex = 3;
  String result = str.substring(0, firstCommaIndex);
  for (int i = firstCommaIndex; i < length; i += 3) {
    result += ',${str.substring(i, i + 3)}';
  }
  return result;
}

String splitPriceByCommaDouble(double number) {
  // Round the number to 3 decimal places
  number = double.parse(number.toStringAsFixed(3));
  // Split the number into integer and fractional parts
  var parts = number.toString().split('.');
  var integerPart = parts[0];
  var fractionalPart = parts.length > 1 ? '.${parts[1]}' : '';
  // Insert commas into the integer part
  int length = integerPart.length;
  if (length <= 3) return integerPart + fractionalPart;
  int firstCommaIndex = length % 3;
  if (firstCommaIndex == 0) firstCommaIndex = 3;
  String formattedIntegerPart = integerPart.substring(0, firstCommaIndex);
  for (int i = firstCommaIndex; i < length; i += 3) {
    formattedIntegerPart += ',${integerPart.substring(i, i + 3)}';
  }
  // Return the formatted integer part followed by the fractional part
  return formattedIntegerPart + fractionalPart;
}
