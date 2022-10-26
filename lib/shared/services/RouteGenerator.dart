import 'package:flutter/material.dart';
import 'package:cura/individual/health.dart';
import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/startup_screens/preview_page.dart';
import 'package:cura/individual/spend_time.dart';
import 'package:cura/individual/adopt.dart';
import 'package:cura/individual/donation_page.dart';
import 'package:cura/organization/postfeed.dart';
import 'package:cura/individual/user_chats_menu.dart';
import 'package:cura/individual/info_page.dart';
import 'package:cura/individual/account_setup.dart';
import '../../../organization/account_setup.dart';
import '../../startup_screens/splash_screen1_3.dart';
import '../../startup_screens/intro_screen.dart';
import 'package:cura/individual/user_chat_screen.dart';
import '../../organization/org_chat_screen.dart';
import 'package:cura/startup_screens/create_account.dart';
import 'package:cura/startup_screens/login.dart';
import 'stringScreenArguments.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AdoptPage.routeName:
        return MaterialPageRoute(builder: (context) => const AdoptPage());
      case ChatScreen.routeName:
        // Getting arguments passed in while calling Navigator.pushNamed
        final args = settings.arguments as StringScreenArguments;
        return MaterialPageRoute(builder: (context) => ChatScreen(orgName: args.nameProvided, imgUrl: args.imgUrl));
      case CreateAccountPage.routeName:
        return MaterialPageRoute(builder: (context) => const CreateAccountPage());
      case DonationPage.routeName:
        return MaterialPageRoute(builder: (context) => const DonationPage());
      case HealthPage.routeName:
        return MaterialPageRoute(builder: (context) => const HealthPage());
      case HomePageIndividual.routeName:
        return MaterialPageRoute(builder: (context) => const HomePageIndividual());
      case IndividualAccountSetup.routeName:
        return MaterialPageRoute(builder: (context) => const IndividualAccountSetup());
      case IndividualInfoPage.routeName:
        return MaterialPageRoute(builder: (context) => const IndividualInfoPage());
      case IntroScreen.routeName:
        return MaterialPageRoute(builder: (context) => const IntroScreen());
      case OrgAccountSetup.routeName:
        return MaterialPageRoute(builder: (context) => const OrgAccountSetup());
      case OrgChatScreen.routeName:
        // Getting arguments passed in while calling Navigator.pushNamed
        final args = settings.arguments as StringScreenArguments;
        return MaterialPageRoute(builder: (context) => OrgChatScreen(userName: args.nameProvided, imgUrl: args.imgUrl));
      case postfeed.routeName:
        return MaterialPageRoute(builder: (context) => const postfeed());
      case PreviewPage.routeName:
        return MaterialPageRoute(builder: (context) => const PreviewPage());
      case SpendTime.routeName:
        return MaterialPageRoute(builder: (context) => const SpendTime());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case UserChatsScreen.routeName:
        return MaterialPageRoute(builder: (context) => const UserChatsScreen());
      case UserLogin.routeName:
        // Getting arguments passed in while calling Navigator.pushNamed
        final args = settings.arguments as bool;
        return MaterialPageRoute(builder: (context) => UserLogin(isPhoneLogin: args));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
