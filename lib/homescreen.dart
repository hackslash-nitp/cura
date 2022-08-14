import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Align(
              alignment: const Alignment(-.5, .8),
              child: Image.asset(
                '',
                height: 350,
                alignment: Alignment.topCenter,
              )),
        ]),
      ),
    );
  }
}
