import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
          Container(
            // color: Colors.white,
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: <Widget>[
                        Container( 
                          child: IconButton(
                            icon: const Icon( 
                              Icons.arrow_back_ios_new,
                              size: 15,
                            ),
                            onPressed: () {
                              print('Pressed');
                            },
                          ),
                        ),
                      ]))
                ])),
        Center(
          child: Text('Welcome!',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'PT Sans',
              )),
        ),
        Align(
      alignment: Alignment(-.5, .8),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/spl4a.png',
        height: 460,
        width: 260,
        alignment: Alignment.topCenter,
      )),
        TextButton(
          onPressed: (() {
            print('Pressed');
          }),
          child: IconButton(
            icon: const Icon(
              Icons.email,
              size: 15,
            ),
            onPressed: (() {}),
          ),
          // clipBehavior: (chi),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.white,
            backgroundColor: const Color.fromARGB(255, 137, 184, 189),
          ),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: const Color.fromARGB(255, 137, 184, 189),
              backgroundColor: Colors.white),
          onPressed: (() {
            print('Pressed');
          }),
          child:IconButton(
            icon: const Icon(
              Icons.phone,
              size: 15,
            ),
            onPressed: (() {}),
          ),),
          Center(
          child: Text('Terms & conditions',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'PT Sans',
              )),
        ),
      ]),
    ));
  }
}

Align alignSplashscreen() {
  return Align(
      alignment: Alignment(-.5, .8),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/spl4a.png',
        height: 450,
        width: 250,
        alignment: Alignment.topCenter,
      ));
}
// Action(const Text('Email')),