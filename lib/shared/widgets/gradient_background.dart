import 'package:flutter/material.dart';

class BiDirectionalBackground extends StatelessWidget {
  const BiDirectionalBackground({
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
          Color.fromARGB(255, 223, 242, 187),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.25],
        tileMode: TileMode.clamp,
      )),
    );
  }
}
