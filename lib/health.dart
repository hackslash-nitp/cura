import 'package:first_app/health.dart';
import 'package:flutter/material.dart';

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
                // MyApp();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Align(
              // alignment: const Alignment(-.5, .8),
              child: Image.asset(
                'assets/Nursing home-rafiki 1.png',
                height: 325,
                width: 325,
                // alignment: Alignment.topCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
