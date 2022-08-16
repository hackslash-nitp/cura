import 'package:flutter/material.dart';
import 'package:cura/organization/Widgets/mydrawer.dart';
class orgprofile extends StatefulWidget {
  const orgprofile({Key? key}) : super(key: key);

  @override
  State<orgprofile> createState() => _orgprofileState();
}

class _orgprofileState extends State<orgprofile> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: mydrawer(),
      
      appBar: AppBar(elevation: 0.00 ,backgroundColor: Colors.transparent ,iconTheme: IconThemeData(color: Colors.black),
      leading: new IconButton(onPressed: ()=>{}, icon: Icon(Icons.keyboard_arrow_left),
      color: Colors.black,),),
      body:Container(
        child: Column(children: [
          Row(
            children: [],
          ),
        ]),
      ),
      bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Color.fromARGB(255, 156, 212, 235),
                    ),
                  ),
                  height: 84,
                  width: 414,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.home_filled,
                          
                        ),
                      ),
                      //SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add_chart,
                        ),
                      ),
                      //SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.message_outlined,
                        ),
                      ),
                      //SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: Color(0xffF989E7),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
 // bottomNavigationBar:BottomNavigationBar(
      //   currentIndex: 0,
      //   items: const [
      //   BottomNavigationBarItem(icon: Icon(Icons.home),
      //   backgroundColor: Colors.blue),
      //   BottomNavigationBarItem(icon: Icon(Icons.add_outlined),
      //   backgroundColor: Colors.blue),
      //   BottomNavigationBarItem(icon: Icon(Icons.chat),
      //   backgroundColor: Colors.blue),
      //   BottomNavigationBarItem(icon: Icon(Icons.person),
      //   backgroundColor: Colors.blue),
      // ],
      // onTap: (index){setState(() {
      //   _currentIndex=index;
      // });},) ,