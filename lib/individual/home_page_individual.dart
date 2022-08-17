import 'package:cura/startup_screens/login.dart';
import 'package:flutter/material.dart';
import '../shared/services/firebase_authentication.dart';

//This is a temporary Home Screen, to be used for testing purposes
class HomePageIndividual extends StatefulWidget {
  const HomePageIndividual({Key? key}) : super(key: key);

  @override
  State<HomePageIndividual> createState() => _HomePageIndividualState();
}

class _HomePageIndividualState extends State<HomePageIndividual> {
  FirebaseAuthentication auth = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await auth
                  .logoutUser(context)
                  .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const UserLogin()),
                      ));
            },
            child: const Text("Log Out"),
          ),
        ),
      ),
    );
  }
}
