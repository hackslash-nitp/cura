import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
//import 'package:cura-1/main.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: 
           Column(children: [
        alignImage(),

        // Align(alignment: Alignment(0,.5),
        //     child :
        //               Text('\nWelcome!',
        //                    style:
        //                          TextStyle
        //                          (
        //                            fontSize: 36,
        //                            fontWeight: FontWeight.bold,
        //                            //letterSpacing:3,
        //                            color: Colors.black,
        //                            fontFamily: 'PT Sans',

        //                          )                    ),
        //       ),
        alignSplashscreen(),
        textWelcome(),
      ])
    ),
  ));
}

Align alignImage() {
  return Align(
      alignment: Alignment(-.98, -.8),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/back_arrow.png',
        height: 30,
        width: 30,
      ));
}

Align alignSplashscreen() {
  return Align(
      alignment: Alignment(-.5, -2),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/spl4.png',
        height: 550,
        width: 320,
      ));
}

textWelcome()
{
  return Text(
         '\nWelcome!',
                           style:
                                 TextStyle
                                 (
                                   fontSize: 36,
                                   fontWeight: FontWeight.bold,
                                   //letterSpacing:3,
                                   color: Colors.black,
                                   fontFamily: 'PT Sans',
                                 ));                   
}

