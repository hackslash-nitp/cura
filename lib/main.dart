// ignore_for_file: prefer_const_constructors
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/material/card.dart';
import 'package:flutter/src/material/text_button.dart';
//import 'package:cura/main.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      body: Column(children: [
        Container(
            color: Colors.white,
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
                            onPressed: () {},
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
        alignSplashscreen(),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.white,
            backgroundColor: const Color.fromARGB(255, 137, 184, 189),
          ),
          onPressed: () {},
          child: Icon(
            Icons.email,
          ),
          
        ),
        TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: const Color.fromARGB(255, 137, 184, 189),
              backgroundColor: Colors.white
              ),
          onPressed: () {},
          child: Text("Phone",
              style: TextStyle(color: Colors.white, fontSize: 30)),
        
        ),
        Center(
          child: Text('Terms & conditions',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'PT Sans',
              )),
              //Icon(Icon.horiz_lined)
        ),
      ]),
    )),
  );
}

Align alignSplashscreen() {
  return Align(
      alignment: Alignment(-.5, .8),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/spl4.png',
        height: 500,
        width: 300,
        alignment: Alignment.topCenter,
      )
      );
}

iconphone() {
  print(Icon(
    Icons.phone,
  ));
}

iconemail() {
  print(Icon(
    Icons.email,
  ));
}
