import 'package:flutter/material.dart';

class Navigation {
  static void navigateToPageWithReplacement(BuildContext context, String widget) {
    Navigator.of(context).pushReplacementNamed(widget);
  }
}
