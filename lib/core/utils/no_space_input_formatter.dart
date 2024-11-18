import 'package:flutter/services.dart';

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Prevent entering spaces
    if (newValue.text.contains(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
