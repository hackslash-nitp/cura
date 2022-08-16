import 'package:flutter/material.dart';
class mydrawer extends StatefulWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    backgroundColor: Color.fromARGB(255, 166, 223, 250),
    child: ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 37,left: 16),
          child: Column(
            children: [
              //profile image
              Container(height: 104,width: 104,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 11,),
              const Text("Welcome!\nOrganisation Name",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
              )
            ],
          ),
        ),
                   const SizedBox(height: 41,)

     //body
     ,Container(padding: const EdgeInsets.only(top: 1),
     child: Column(
      children: [
        const Divider(height: 10,thickness: 2,color: Colors.black,),
        ListTile(title: const Text('Doner Contact',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Donation Records',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Work Notifications',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Post Engangements',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Edit Profile',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Settings',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
         ListTile(title: const Text('Log Out',style: TextStyle(fontSize: 14,color: Colors.black)
        ,),
        onTap: (){

        },),
        const Divider(height: 10,thickness: 2,color: Colors.black,),
  
      ],
     ),) ],
    ),
    );
    
  }
}