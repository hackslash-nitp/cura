import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './adopt.dart';
import 'health.dart';

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
            BiDirectionalBackground(),
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
              margin: EdgeInsets.all(15),
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
                onPressed: (() {
                  CustomSerachHomepage();
                }),
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
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      containerShadow(),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  height: 209,
                                  width: 370,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                  margin: EdgeInsets.all(15),
                                  height: 209,
                                  width: 370,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        primary: Color.fromARGB(255, 0, 0, 0),
                                        backgroundColor: Colors.white),
                                    onPressed: (() {}),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: healthextraImage(),
                                        ),
                                        healthTextall(),
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
                                  margin: EdgeInsets.all(10),
                                  height: 209,
                                  width: 370,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                  margin: EdgeInsets.all(10),
                                  height: 209,
                                  width: 370,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        primary: Color.fromARGB(255, 0, 0, 0),
                                        backgroundColor: Colors.white),
                                    onPressed: (() {}),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: spendTimeextraImage(),
                                        ),
                                        spendtimeTextall(),
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
                                  margin: EdgeInsets.all(10),
                                  height: 209,
                                  width: 370,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomDecoration(),
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
          height: 179,
          width: 179,
          decoration: BoxDecoration(
            boxShadow: [
              containerShadow(),
            ],
            borderRadius: BorderRadius.circular(26),
            color: const Color.fromARGB(255, 199, 226, 228),
            image: DecorationImage(
              image: AssetImage('assets/Nursing home-rafiki 1.png'),
            ),
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
            color: const Color.fromARGB(255, 199, 226, 228),
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
            color: const Color.fromARGB(255, 199, 226, 228),
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
            color: const Color.fromARGB(255, 199, 226, 228),
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
            "\n\n  Adopt ",
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
            "\n\n  Spend Time ",
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
            "\n\nPost Feed ",
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
            "\n\n\nDonate ",
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
          alignment: Alignment.topRight,
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
          alignment: Alignment.topRight,
          child: Text(
            "  Give them free\n  treat ",
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

class CustomSerachHomepage extends SearchDelegate {
  List<String> searchTerms = [
    'Adopt',
    'Donate',
    'Health',
    'Spend Time',
    'Post Feed'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var process in searchTerms) {
      if (process.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(process);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var process in searchTerms) {
      if (process.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(process);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class BiDirectionalBackground extends StatelessWidget {
  const BiDirectionalBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF6CAFB4),
          Colors.white,
          Colors.white,
          Color(0xFF6CAFB4),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.25, 0.8, 1.0],
        tileMode: TileMode.clamp,
      )),
    );
  }
}

bottomDecoration() {
  return Container(
    margin: EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 199, 226, 228),
      borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero),
      border: Border.all(
        color: Color.fromARGB(255, 156, 212, 235),
      ),
    ),
    height: 50,
    width: 350,
    // color: Color.fromARGB(255, 199, 226, 228),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.home_filled,
            color: Color(0xFF668086),
          ),
        ),
        //SizedBox(width: 10),
        MaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.add_chart,
            color: Colors.black,
          ),
        ),
        //SizedBox(width: 10),
        MaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.message_outlined,
          ),
        ),
        //SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    ),
  );
}

class UniDirectionalBackground extends StatelessWidget {
  const UniDirectionalBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF6CAFB4),
          Colors.white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.25],
        tileMode: TileMode.clamp,
      )),
    );
  }
}