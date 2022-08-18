import 'package:flutter/material.dart';
class mydrawer extends StatefulWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
    final List<String> entries=['Doner Contact','Donation Records','Work Notifications','Post Engangements','Edit Profile','Settings','Log Out'];

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
                   const SizedBox(height: 41,),

     //body
      Expanded(
          child: Container(
            height: double.maxFinite,
            child: ListView.separated(itemBuilder: ((context, index) {
               return ListTile(tileColor: Color.fromRGBO(199, 226,228, 1),title:Text(entries[index],style: const TextStyle(fontSize: 14,color: Colors.black,)
               ),);
             }),
              separatorBuilder: (((context, index) {
          return const Divider(height: 4,thickness: 1,color:Color.fromRGBO(146, 183, 192, 0.8),);
              })),
               itemCount: entries.length),
          ),
        ),
      ],
    ),
    );
    
  }
}