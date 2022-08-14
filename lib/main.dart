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
              // alignment: const Alignment(-.5, .8),
              child: Image.asset(
            'assets/Mobile life-amico 2.png',
            height: 325,
            width: 325,
            // alignment: Alignment.topCenter,
          )),
          Container(
            margin: EdgeInsets.all(0),
            height: 40,
            width: 400,
            child: TextButton(
              style: TextButton.styleFrom(
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(180),
                  ),
                  primary: const Color.fromARGB(255, 137, 184, 189),
                  backgroundColor: Colors.white),
              onPressed: (() {}),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
