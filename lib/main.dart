import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './adopt.dart';
import './health.dart';

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
              ),
            ),
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
            Column(
              children: [
                Scrollbar(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
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
                                onPressed: (() {
                                  Adoptpage();
                                }),
                                child: Row(
                                  children: <Widget>[
                                    adopttextall(),
                                    Container(
                                      child: adoptextraImage(),
                                    ),
                                  ],
                                ),
                                // Container(
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
                                child: Row(
                                  children: <Widget>[
                                    healthTextall(),
                                    Container(
                                      child: healthextraImage(),
                                    ),
                                  ],
                                ),
                                // Container(
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
                                onPressed: (() {
                                  Healthpage();
                                }),
                                child: Row(
                                  children: <Widget>[
                                    donateTextall(),
                                    Container(
                                      child: donateextraImage(),
                                    ),
                                  ],
                                ),
                                // Container(
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
                                child: Row(
                                  children: <Widget>[
                                    spendtimeTextall(),
                                    Container(
                                      child: spendTimeextraImage(),
                                    ),
                                  ],
                                ),
                                // Container(
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
                                child: Row(
                                  children: <Widget>[
                                    postfeedTextall(),
                                    Container(
                                      child: postfeedextraImage(),
                                    ),
                                  ],
                                ),
                                // Container(
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

adoptextraImage() {
  return Row(
    children: <Widget>[
      Container(
        height: 179,
        width: 179,
        decoration: BoxDecoration(
          boxShadow: [
            containerShadow(),
          ],
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(255, 199, 226, 228),
          image: DecorationImage(
            image: AssetImage('assets/Parents-cuate 1.png'),
          ),
        ),
      ),
    ],
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

adopttextall() {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\n\n\n  Adopt ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 184, 189),
                fontSize: 25,
                fontFamily: 'PT Sans'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "   Adopt an old person \n   and a child ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(150, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'PT Sans'),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

spendtimeTextall() {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\n\n\n  Spend Time ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 184, 189),
                fontSize: 25,
                fontFamily: 'PT Sans'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "   Spend time with \n   childern and \n   old person ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(150, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'PT Sans'),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

postfeedTextall() {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\n\n\n  Post Feed ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 184, 189),
                fontSize: 25,
                fontFamily: 'PT Sans'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "   Know more about \n   old person \n   children ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(150, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'PT Sans'),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

donateTextall() {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\n\n\n  Donate ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 184, 189),
                fontSize: 25,
                fontFamily: 'PT Sans'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "   Donate for their \n   needs ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(150, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'PT Sans'),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

healthTextall() {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\n\n\n  Health ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 184, 189),
                fontSize: 25,
                fontFamily: 'PT Sans'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "   Give them free treat ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(150, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'PT Sans'),
            // textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}
