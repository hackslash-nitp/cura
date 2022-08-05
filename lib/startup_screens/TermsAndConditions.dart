// @dart=2.9
import 'package:cura/main.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Splash screen 4";
  @override
  Widget build(BuildContext context) {
    SafeArea(
        child: IntroductionScreen(pages: [
      PageViewModel(
          title: 'Welcome',
          body: 'Hye',
          image: buildImage(
              'assets/startup_assets/preview_splash_assets/spl4.png'))
    ], done: Text('Read', style: TextStyle(fontWeight: FontWeight.normal))));
  }
}
Widget buildImage(String path) {
  return Center(
      child: Image.asset(
    path,
    width: 370,
  ));
}
PageDecoration getPageDecoration()
{
  PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding : EdgeInsets.all(7).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24)
    ); 
}
