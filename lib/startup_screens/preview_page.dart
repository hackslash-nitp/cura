import 'package:flutter/material.dart';
import 'splash_screen1_3.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/cura_logo.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Image(
                          image: AssetImage(
                              "assets/startup_assets/preview_splash_assets/Group 43.png"),
                          width: 350,
                          height: 300),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: Colors.white,
                backgroundColor: const Color.fromARGB(255, 137, 184, 189),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: ((context) => SplashScreen()),
                ));
              },
              child: Text(
                "WELCOME",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
