import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'orglogin.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {'login': (context) => const Orglogin()},
      ), /*SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.blueGrey))*/
    );
