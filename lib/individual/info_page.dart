import 'package:cura/shared/services/firebase_authentication.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:cura/startup_screens/login.dart';
import 'package:flutter/material.dart';

class IndividualInfoPage extends StatefulWidget {
  const IndividualInfoPage({Key? key}) : super(key: key);

  @override
  State<IndividualInfoPage> createState() => _IndividualInfoPageState();
}

class _IndividualInfoPageState extends State<IndividualInfoPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: individualdrawer(),
        appBar: AppBar(
          elevation: 0.00,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.keyboard_arrow_left),
            color: Colors.black,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 20.0,
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.065,
                    backgroundImage: (AssetImage("assets/profile_girl.jpg")),
                  ),
                  Column(
                    children: [
                      Text(
                        'Donor Name \nDesignation',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.044,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.087,
                        height: MediaQuery.of(context).size.height * 0.032,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(199, 226, 228, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height *
                                        0.0076)),
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
                color: Color.fromRGBO(0, 0, 0, 0.75),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'xyz@gmail.com',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.026,
                        ),
                        Text(
                          'Contact Number',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '9584899876',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.026,
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Patna',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.026,
                        ),
                        Text(
                          'Country',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
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
                          height: MediaQuery.of(context).size.height * 0.026,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.104,
                          width: MediaQuery.of(context).size.height * 0.43,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Color.fromRGBO(199, 226, 228, 1),
                                filled: true,
                                hintText: 'About\n',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.02))),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.43,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(199, 226, 228, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.0076)),
                            ),
                            child: Text(
                              'My Donations',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.028,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(currentIndex: 3));
  }
}

class individualdrawer extends StatefulWidget {
  const individualdrawer({Key? key}) : super(key: key);

  @override
  State<individualdrawer> createState() => _individualdrawerState();
}

class _individualdrawerState extends State<individualdrawer> {
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(146, 183, 192, 0.8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 37, left: 16),
            child: Column(
              children: [
                //profile image
                Container(
                  height: 100,
                  width: 100,
                  child: const CircleAvatar(
                    backgroundImage: (AssetImage("assets/image1.png")),
                    backgroundColor: Colors.transparent,
                    // backgroundImage: AssetImage('assets/cura_logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Text(
                  "Welcome!\nDonor Name",
                  style: TextStyle(
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
                  tileColor: Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Your Donations',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 4,
                  thickness: 1,
                  color: Color.fromRGBO(146, 183, 192, 0.8),
                ),
                ListTile(
                  tileColor: Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Edit Profile',
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
                  tileColor: Color.fromRGBO(199, 226, 228, 1),
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
                  tileColor: Color.fromRGBO(199, 226, 228, 1),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  onTap: () async {
                    await _auth.logoutUser(context);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => UserLogin(
                                  isPhoneLogin: true,
                                )),
                        (route) => false);
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
