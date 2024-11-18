import 'dart:developer';

import 'package:flutter/material.dart';

import 'navigation_service.dart';

class Utility {
  void goToNextScreen(Widget screen) {
    Navigator.push(NavigationService.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => screen));
  }

// Check any email is valid or not
  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

// if you want to show toast then use this method
  void showSnackBar(String msg) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(msg)));
  }

// print any of the value useing this method
  void debug(var value) {
    log(value);
  }
  
}
