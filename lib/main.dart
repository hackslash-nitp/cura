import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/individual/support_team_page.dart';
import 'package:cura/startup_screens/preview_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'individual/user_chats_page.dart';
import 'shared/services/firebase_authentication.dart';

Future<void> main() async {
  //Don't change the following code
  //If you want to test out your screen, set the home property to the desired page in ScreenDecider
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
      title: 'Cura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home:UserChatsPage(),
=======
      home: auth.getCurrentUser() == null
          ? const PreviewPage() // directly access by substituting in place of PreviewPage()
          : const HomePageIndividual(),
>>>>>>> ccf11f6d91d69c07b0bc30c1f525a1dab56b1c57
    );
  }
}
