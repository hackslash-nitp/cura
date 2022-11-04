import 'package:cura/individual/my_donations.dart';
import 'package:cura/individual/support_team_page.dart';
import 'package:cura/startup_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:cura/shared/services/RouteGenerator.dart';
import '../../individual/account_setup.dart';

class mydrawer extends StatelessWidget {
  mydrawer({Key? key}) : super(key: key);

  @override
  final List<String> entries = [
    'Doner Contact',
    'Donation Records',
    'Work Notifications',
    'Post Engangements',
    'Edit Profile',
    'Support Team',
    'Log Out'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 166, 223, 250),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF6CAFB4),
            Colors.white,
            Colors.white,
            Color(0xFF6CAFB4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        )),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(top: 37, left: 16),
              child: Column(
                children: [
                  //profile image
                  SizedBox(
                    height: 104,
                    width: 104,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 240, 186, 156),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Welcome!\nOrganisation Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 41,
            ),

            //body
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return ListTile(
                        onTap: () {
                          if (entries[index] == 'Donation Records') {
                            Navigator.of(context)
                                .pushNamed(MyDonationsScreen.routeName);
                          }

                          if (entries[index] == 'Edit Profile') {
                            Navigator.of(context)
                                .pushNamed(IndividualAccountSetup.routeName);
                          }
                          if (entries[index] == 'Support Team') {
                            Navigator.of(context)
                                .pushNamed(SupportPage.routeName);
                          }

                          if (entries[index] == 'Log Out') {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                UserLogin.routeName, (route) => false,
                                arguments: true);
                          }
                        },
                        tileColor: Color.fromARGB(255, 255, 253, 253),
                        title: Text(entries[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      );
                    }),
                    separatorBuilder: (((context, index) {
                      return Divider(
                        height: 4,
                        thickness: 1,
                        color: Color.fromARGB(204, 42, 129, 151),
                      );
                    })),
                    itemCount: entries.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
