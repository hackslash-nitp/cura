import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Adoptpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Text(
              'Adopt',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'PT Sans',
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 24,
              ),
              onPressed: () {
                MyApp();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Align(
              // alignment: const Alignment(-.5, .8),
              child: Image.asset(
                'assets/Parents-cuate 1.png',
                height: 400,
                width: 400,
                // alignment: Alignment.topCenter,
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
                      child: adoptface1Image(),
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
                      child: adoptface2Image(),
                    ),
                  ],
                ),
                // Container(
              ),
            ),
          ],
        ),
      ),
    );
  }
}

adoptface1Image() {
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
              image: AssetImage('assets/images 1.png'),
            ),
          ),
        ),
      ],
    ),
  );
}

adoptface2Image() {
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
              image: AssetImage('assets/images 1.png'),
            ),
          ),
        ),
      ],
    ),
  );
}
