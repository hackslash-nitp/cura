import 'package:cura/individual/health1.dart';
import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/individual/info_page.dart';
import 'package:cura/individual/user_chats_menu.dart';
import 'package:cura/organization/postfeed.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const CustomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> navItems = [
      const HomePageIndividual(),
      const postfeed(),
      const UserChatsScreen(),
      const IndividualInfoPage(),
      const health1()
    ];

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 22, 115, 121),
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.currentIndex,
        onTap: ((value) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => navItems[value]));
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFFC7E2E4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "Add",
            backgroundColor: Color(0xFFC7E2E4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chats",
            backgroundColor: Color(0xFFC7E2E4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            backgroundColor: Color(0xFFC7E2E4),
          ),
        ]);
  }
}
