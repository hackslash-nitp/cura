import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/material/card.dart';
import 'package:flutter/src/material/text_button.dart';
// import 'package:cura-1/main.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: Column(children: [ Container(
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
          ]))
      ,
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
      
      SizedBox(
         child: 
         Card(
          color: Color.fromARGB(1, 142, 182, 192),
          child:
          Center(
        child: Text('Email',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontFamily: 'PT Sans',
            )),
      ),),
        height: 20,
        width: 250,
      ),
      SizedBox(
         child: 
         Card(
          color: Colors.white,
          child:
          Center(
        child: Text('Phone',
            style:TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontFamily: 'PT Sans',
            )),
      ),),
        height: 20,
        width: 250,
      )
      
    
  ])),
  ));
}


Align alignSplashscreen() {
  return Align(
      alignment: Alignment(-.5, .8),
      child: Image.asset(
        'assets/startup_assets/preview_splash_assets/spl4.png',
        height: 550,
        width: 320,
        
      ));
}


