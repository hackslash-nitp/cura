// import 'package:first_app/main.dart';
import 'dart:developer';
import 'dart:js';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'main.dart';

class Healthpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Text(
              'Health',
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
            BiDirectionalBackground(),
            Align(
              // alignment: const Alignment(-.5, .8),
              child: Image.asset(
                'assets/Nursing home-rafiki 1.png',
                height: 325,
                width: 325,
                // alignment: Alignment.topCenter,
              ),
            ),
            Container(
              height: 405,
              width: 350,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  containerShadow(),
                ],
                color: Color.fromRGBO(226, 239, 240, 1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color.fromRGBO(162, 194, 201, 1),
                ),
              ),
              child: Column(
                children: [
                  selectOrganisation(),
                  Row(
                    children: [
                      selectdate(),
                      selecttime(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: bottomDecoration(),
      ),
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

class organisationList extends SearchDelegate {
  List<String> searchTerms = [
    'Organisation 1',
    'Organisation 2',
    'Organisation 3',
    'Organisation 4',
    'Organisation 5',
    'Organisation 6',
    'Organisation 7',
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

selectOrganisation() {
  return Column(
    children: [
      Text(
        "Select Organisation",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 22,
          fontFamily: 'PT Sans',
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
        width: 250,
        child: TextButton(
          style: TextButton.styleFrom(
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              primary: Color.fromARGB(255, 0, 0, 0),
              backgroundColor: Colors.white),
          onPressed: (() {
            organisationList();
          }),
          child: Row(
            children: [
              Text(
                "   Enter Organisation's name",
                style: TextStyle(
                    color: Color.fromARGB(102, 24, 22, 22),
                    fontSize: 14,
                    fontFamily: 'PT Sans'),
                textAlign: TextAlign.left,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(180),
                        topRight: Radius.circular(180)),
                  ),
                  primary: const Color.fromARGB(255, 137, 184, 189),
                  backgroundColor: Color.fromRGBO(163, 197, 204, 1),
                ),
                onPressed: (() {
                  organisationList();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

selectdate() {
  return Column(
    children: [
      Text(
        "Date",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 22,
          fontFamily: 'PT Sans',
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
        width: 125,
        child: TextButton(
          style: TextButton.styleFrom(
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              primary: Color.fromARGB(255, 0, 0, 0),
              backgroundColor: Colors.white),
          onPressed: (() {
            dateList();
          }),
          child: Row(
            children: [
              Text(
                "Date",
                style: TextStyle(
                    color: Color.fromARGB(102, 24, 22, 22),
                    fontSize: 14,
                    fontFamily: 'PT Sans'),
                textAlign: TextAlign.left,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(180),
                        topRight: Radius.circular(180)),
                  ),
                  primary: const Color.fromARGB(255, 137, 184, 189),
                  backgroundColor: Color.fromRGBO(163, 197, 204, 1),
                ),
                onPressed: (() {
                  dateList();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

selecttime() {
  return Column(
    children: [
      Text(
        "Time",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 22,
          fontFamily: 'PT Sans',
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
        width: 125,
        child: TextButton(
          style: TextButton.styleFrom(
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              primary: Color.fromARGB(255, 0, 0, 0),
              backgroundColor: Colors.white),
          onPressed: (() {
            timeList();
          }),
          child: Row(
            children: [
              Text(
                "Date",
                style: TextStyle(
                    color: Color.fromARGB(102, 24, 22, 22),
                    fontSize: 14,
                    fontFamily: 'PT Sans'),
                textAlign: TextAlign.left,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(180),
                        topRight: Radius.circular(180)),
                  ),
                  primary: const Color.fromARGB(255, 137, 184, 189),
                  backgroundColor: Color.fromRGBO(163, 197, 204, 1),
                ),
                onPressed: (() {
                  timeList();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

selecthealthCheckup() {
  return Column(
    children: [
      Text(
        "Type of Health Checkup",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 22,
          fontFamily: 'PT Sans',
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
        width: 250,
        child: TextButton(
          style: TextButton.styleFrom(
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              primary: Color.fromARGB(255, 0, 0, 0),
              backgroundColor: Colors.white),
          onPressed: (() {
            healthcheckupList();
          }),
          child: Row(
            children: [
              Text(
                "   Type of Health Checkup",
                style: TextStyle(
                    color: Color.fromARGB(102, 24, 22, 22),
                    fontSize: 14,
                    fontFamily: 'PT Sans'),
                textAlign: TextAlign.left,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(180),
                        topRight: Radius.circular(180)),
                  ),
                  primary: const Color.fromARGB(255, 137, 184, 189),
                  backgroundColor: Color.fromRGBO(163, 197, 204, 1),
                ),
                onPressed: (() {
                  healthcheckupList();
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class healthcheckupList extends SearchDelegate {
  List<String> searchTerms = [
    'Organisation 1',
    'Organisation 2',
    'Organisation 3',
    'Organisation 4',
    'Organisation 5',
    'Organisation 6',
    'Organisation 7',
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

dateList() {
  return 
  showDatePicker(
    context: context,
   initialDate: DateTime.now(), 
   firstDate: DateTime(2001), 
   lastDate: DateTime(2100),);
}

timeList() {
  return Column(
    children: [],
  );
}
