import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Align(
                // alignment: const Alignment(-.5, .8),
                child: Image.asset(
              'assets/Mobile life-amico 2.png',
              height: 325,
              width: 325,
              // alignment: Alignment.topCenter,
            )),
            Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                boxShadow: [
                  containerShadow(),
                ],
              ),
              margin: EdgeInsets.all(20),
              height: 40,
              width: 400,
              child: TextButton(
                style: TextButton.styleFrom(
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180),
                    ),
                    primary: Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: Colors.white),
                onPressed: (() {}),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 23,
                    ),
                    Text(
                      "     Search Here",
                      style: TextStyle(
                          color: Color.fromARGB(102, 24, 22, 22),
                          fontSize: 17,
                          fontFamily: 'PT Sans'),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        containerShadow(),
                      ],
                    ),
                    margin: EdgeInsets.all(0),
                    height: 209,
                    width: 370,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          primary: Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Colors.white),
                      onPressed: (() {}),
                      child: Column(
                        children: [
                          adoptextraImage(),
                          adoptText(),
                          adoptotherText()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        containerShadow(),
                      ],
                    ),
                    margin: EdgeInsets.all(0),
                    height: 209,
                    width: 370,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          primary: Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Colors.white),
                      onPressed: (() {}),
                      child: Column(
                        children: [
                          healthextraImage(),
                          healthText(),
                          healthotherText()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        containerShadow(),
                      ],
                    ),
                    margin: EdgeInsets.all(0),
                    height: 209,
                    width: 370,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          primary: Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Colors.white),
                      onPressed: (() {}),
                      child: Column(
                        children: [
                          donateextraImage(),
                          donateText(),
                          donateotherText()
                        ],
                      ),
                    ),
                  ),
                   Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        containerShadow(),
                      ],
                    ),
                    margin: EdgeInsets.all(0),
                    height: 209,
                    width: 370,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          primary: Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Colors.white),
                      onPressed: (() {}),
                      child: Column(
                        children: [
                          spendTimeextraImage(),
                          spendTimeText(),
                          spendTimeotherText()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

adoptextraImage() {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          height: 189,
          width: 189,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 137, 184, 189),
            image: DecorationImage(
                image: AssetImage('assets/Parents-cuate 1.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    ),
  );
}

adoptText() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      "\n\n\n  Adopt",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 137, 184, 189),
          fontSize: 25,
          fontFamily: 'PT Sans'),
    ),
  );
}

adoptotherText() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "   Adopt an old person \n   and a child ",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 18,
          fontFamily: 'PT Sans'),
      // textAlign: TextAlign.left,
    ),
  );
}

containerShadow() {
  return BoxShadow(
    color: Color.fromARGB(83, 29, 28, 28),
    offset: Offset(0, 4),
    blurRadius: 10,
    spreadRadius: .4,
  );
}

healthText() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Text(
      "\n\n\n  Health",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 137, 184, 189),
          fontSize: 25,
          fontFamily: 'PT Sans'),
    ),
  );
}

healthotherText() {
  return Align(
    alignment: Alignment.centerRight,
    child: Text(
      "   Give them free treat",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 18,
          fontFamily: 'PT Sans'),
      // textAlign: TextAlign.left,
    ),
  );
}

healthextraImage() {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          height: 189,
          width: 189,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 137, 184, 189),
            image: DecorationImage(
                image: AssetImage('assets/Nursing home-rafiki 1.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    ),
  );
}

donateextraImage() {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          height: 189,
          width: 189,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 137, 184, 189),
            image: DecorationImage(
                image: AssetImage('assets/Humanitarian Help-bro 1.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    ),
  );
}

donateText() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      "\n\n\n  Donate",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 137, 184, 189),
          fontSize: 25,
          fontFamily: 'PT Sans'),
    ),
  );
}

donateotherText() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "   Donate for their \n   needs ",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 18,
          fontFamily: 'PT Sans'),
      // textAlign: TextAlign.left,
    ),
  );
}

spendTimeText() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Text(
      "\n\n\n  Spend Time",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 137, 184, 189),
          fontSize: 25,
          fontFamily: 'PT Sans'),
    ),
  );
}

spendTimeotherText() {
  return Align(
    alignment: Alignment.centerRight,
    child: Text(
      "   Spend time with \n   childern and \n   old person",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 18,
          fontFamily: 'PT Sans'),
      // textAlign: TextAlign.left,
    ),
  );
}

spendTimeextraImage() {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          height: 189,
          width: 189,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 137, 184, 189),
            image: DecorationImage(
                image: AssetImage('assets/Nursing home-rafiki 1.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    ),
  );
}

postfeedextraImage() {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          height: 189,
          width: 189,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 137, 184, 189),
            image: DecorationImage(
                image: AssetImage('assets/Parents-cuate 1.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    ),
  );
}

postfeedText() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      "\n\n\n  Posts Feed",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 137, 184, 189),
          fontSize: 25,
          fontFamily: 'PT Sans'),
    ),
  );
}

postfeedotherText() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "   Know more about \n   old person \n   children",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 18,
          fontFamily: 'PT Sans'),
      // textAlign: TextAlign.left,
    ),
  );
}