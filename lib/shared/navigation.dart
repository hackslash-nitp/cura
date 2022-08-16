import 'package:flutter/material.dart';

class Navigation {
  static void navigateToPageWithReplacement(
      BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
