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