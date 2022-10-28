import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/shared/services/firebase_authentication.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:cura/startup_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'account_setup.dart';
import 'my_donations.dart';

class IndividualInfoPage extends StatefulWidget {
  static const String routeName = '/IndividualInfoPage';
  const IndividualInfoPage({Key? key}) : super(key: key);

  @override
  State<IndividualInfoPage> createState() => _IndividualInfoPageState();
}

class _IndividualInfoPageState extends State<IndividualInfoPage> {
  static const String routeName = '/IndividualInfoPage';
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
          key: _key,
          drawer: individualdrawer(),
          appBar: AppBar(
            elevation: 0.00,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black, size: 25.h),
            leading: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(HomePageIndividual.routeName),
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 35.w,
              ),
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30.w,
                    )),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 80.r,
                        backgroundImage: (AssetImage("assets/girl.png")),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.sp),
                            child: Text(
                              'Donor Name \nDesignation',
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 150.w),
                            child: SizedBox(
                              width: 90.w,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.of(context).pushNamed(
                                      IndividualAccountSetup.routeName)
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: 17.w,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 66, 154, 160),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                //const SizedBox(height: 17,),
                Divider(
                  thickness: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.75),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 30.h, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'xyz@gmail.com',
                          style: TextStyle(
                              fontSize: 20.h, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Contact Number',
                          style: TextStyle(
                              fontSize: 30.h, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '9584899876',
                          style: TextStyle(
                              fontSize: 20.h, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize: 30.h, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Patna',
                          style: TextStyle(
                              fontSize: 20.h, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Country',
                          style: TextStyle(
                              fontSize: 30.h, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'India',
                          style: TextStyle(
                              fontSize: 20.h.w, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h.w,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 30.h, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 80.h,
                          width: double.infinity,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 173, 223, 228),
                                filled: true,
                                hintText: 'About\n',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r))),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 65.h.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MyDonationsScreen.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 66, 154, 160),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                            child: Text(
                              'My  Donations',
                              style: TextStyle(
                                  fontSize: 30.h, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: CustomNavigationBar(currentIndex: 3)),
    );
  }
}

class individualdrawer extends StatelessWidget {
  individualdrawer({Key? key}) : super(key: key);
  //final FirebaseAuthentication _auth = FirebaseAuthentication();
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
                  tileColor: Color.fromRGBO(199, 226, 228, 1),
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
                  // onTap: () async {
                  // await _auth.logoutUser(context);
                  //Navigator.of(context).pushNamedAndRemoveUntil(
                  //  UserLogin.routeName, (route) => false,
                  //arguments: true);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) => UserLogin(
                  //               isPhoneLogin: true,
                  //             )),
                  //     (route) => false);
                  //},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
