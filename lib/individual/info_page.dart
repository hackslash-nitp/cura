import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/shared/services/firebase_authentication.dart';
import 'package:cura/shared/services/firebase_database.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:cura/startup_screens/login.dart';
import 'package:flutter/material.dart';
import 'account_setup.dart';
import 'my_donations.dart';

Map userData = {};

class IndividualInfoPage extends StatefulWidget {
  static const String routeName = '/IndividualInfoPage';
  const IndividualInfoPage({Key? key}) : super(key: key);

  @override
  State<IndividualInfoPage> createState() => _IndividualInfoPageState();
}

class _IndividualInfoPageState extends State<IndividualInfoPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  FirestoreDatabase fd = FirestoreDatabase();
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  bool isLoading = true;

  @override
  void initState() {
    isLoading = true;
    fd.getIndividualProfileData(_auth.getCurrentUser()!.uid).then((value) {
      userData = value;
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            key: _key,
            drawer: individualdrawer(),
            appBar: AppBar(
              elevation: 0.00,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                  color: Colors.black,
                  size: MediaQuery.of(context).size.height * 0.025),
              leading: IconButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(HomePageIndividual.routeName),
                icon: const Icon(Icons.keyboard_arrow_left),
                color: Colors.black,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 20.0,
                    ))
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.065,
                      backgroundImage: (NetworkImage(userData['imgUrl'])),
                    ),
                    Column(
                      children: [
                        Text(
                          userData["individualName"] +
                              "\n" +
                              userData["occupation"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.013),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.087,
                          height: MediaQuery.of(context).size.height * 0.032,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(IndividualAccountSetup.routeName)
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(199, 226, 228, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.0076)),
                            ),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                //const SizedBox(height: 17,),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.02,
                  thickness: 1,
                  color: const Color.fromRGBO(0, 0, 0, 0.75),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              userData["individualEmail"],
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            Text(
                              'Contact Number',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              userData["individualContact"],
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            Text(
                              'City',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              userData["city"],
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            Text(
                              userData["country"],
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'India',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            Text(
                              'About',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              userData["bio"],
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.43,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(MyDonationsScreen.routeName);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(199, 226, 228, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.0076)),
                                ),
                                child: Text(
                                  'My Donations',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.028,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            bottomNavigationBar: const CustomNavigationBar(currentIndex: 3));
  }
}

class individualdrawer extends StatelessWidget {
  individualdrawer({Key? key}) : super(key: key);
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(146, 183, 192, 0.8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 37, left: 16),
            child: Column(
              children: [
                //profile image
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: (NetworkImage(userData['imgUrl'])),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  "Welcome!\n${userData["individualName"]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 41,
          ),

          //body
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                ListTile(
                  tileColor: const Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Your Donations',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MyDonationsScreen.routeName);
                  },
                ),
                const Divider(
                  height: 4,
                  thickness: 1,
                  color: Color.fromRGBO(146, 183, 192, 0.8),
                ),
                ListTile(
                  tileColor: const Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(IndividualAccountSetup.routeName);
                  },
                ),
                const Divider(
                  height: 4,
                  thickness: 1,
                  color: Color.fromRGBO(146, 183, 192, 0.8),
                ),
                ListTile(
                  tileColor: const Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 4,
                  thickness: 1,
                  color: Color.fromRGBO(146, 183, 192, 0.8),
                ),
                ListTile(
                  tileColor: const Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  onTap: () async {
                    await _auth.logoutUser(context);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        UserLogin.routeName, (route) => false,
                        arguments: true);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
