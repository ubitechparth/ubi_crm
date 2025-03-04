import 'dart:convert';

String encode5t(String str) {
  for (int i = 0; i < 5; i++) {
    // Apply Base64 encoding
    str = base64Encode(utf8.encode(str));
    // Reverse the string
    str = str.split('').reversed.join('');
  }
  return str;
}

String decode5t(String str) {
  for (int i = 0; i < 5; i++) {
    // Reverse the string, then decode from Base64
    str = utf8.decode(base64.decode(str.split('').reversed.join()));
  }
  return str;
}