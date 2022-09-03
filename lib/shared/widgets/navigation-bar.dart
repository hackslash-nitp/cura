import 'package:flutter/material.dart';

class navigationbar extends StatefulWidget {
  const navigationbar({Key? key}) : super(key: key);

  @override
  State<navigationbar> createState() => _navigationbarState();
}

class _navigationbarState extends State<navigationbar> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 22, 115, 121),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Color.fromARGB(255, 193, 236, 239),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'add',
              backgroundColor: Color.fromARGB(255, 193, 236, 239),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_outline),
              label: 'chat',
              backgroundColor: Color.fromARGB(255, 193, 236, 239),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'profile',
              backgroundColor: Color.fromARGB(255, 193, 236, 239),
            ),
          ]),
    ));
  }
}
