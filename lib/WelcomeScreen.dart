import 'dart:ui';

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
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Welcome!',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'PT Sans',
                            )),
                        Align(
                            alignment: Alignment(-.5, .8),
                            child: Image.asset(
                              'assets/startup_assets/preview_splash_assets/spl4a.png',
                              height: 350,
                              alignment: Alignment.topCenter,
                            )),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 137, 184, 189),
                              width: 1.5,
                            ),
                          ),
                          margin: EdgeInsets.all(7),
                          height: 53,
                          width: 378,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.email,
                                  size: 24,
                                ),
                                const Text(
                                  " Email",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'PT Sans'),
                                ),
                              ],
                            ),
                            // clipBehavior: (chi),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 137, 184, 189),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(7),
                          height: 53,
                          width: 378,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 137, 184, 189),
                              width: 1.5,
                            ),
                            color: const Color.fromARGB(255, 137, 184, 189),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                primary:
                                    const Color.fromARGB(255, 137, 184, 189),
                                backgroundColor: Colors.white),
                            onPressed: (() {}),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 15,
                                ),
                                const Text(
                                  " Phone",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'PT Sans'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Center(
                          child: Text('Terms & conditions',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'PT Sans',
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
