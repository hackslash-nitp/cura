import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/startup_screens/preview_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'organization/orgprofile/orglogin.dart';
import 'shared/services/firebase_authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ScreenDecider());
}

class ScreenDecider extends StatelessWidget {
  const ScreenDecider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication auth = FirebaseAuthentication();
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Cura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: auth.getCurrentUser() == null
          ? PreviewPage()
          : const HomePageIndividual(),
    );
  }
}