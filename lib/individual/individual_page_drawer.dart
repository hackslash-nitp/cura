import 'package:flutter/material.dart';
class individualdrawer extends StatefulWidget {
  const individualdrawer({Key? key}) : super(key: key);

  @override
  State<individualdrawer> createState() => _individualdrawerState();
}
class _individualdrawerState extends State<individualdrawer> {
  @override
    final List<String> entries=['Your Donations','Edit Profile','Settings','Log Out'];

  Widget build(BuildContext context) {
    return Drawer(
    backgroundColor: Color.fromRGBO(146, 183, 192, 0.8),
    child:Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 37,left: 16),
          child: Column(
            children: [
              //profile image
              Container(height: 104,width: 104,
                child: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  // backgroundImage: AssetImage('assets/cura_logo.png'),
                ),
              ),
              const SizedBox(height: 11,),
              const Text("Welcome!\nDoner Name",
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
               return ListTile(tileColor: Color.fromRGBO(199, 226,228, 1),title:Text(entries[index],style: TextStyle(fontSize: 14,color: Colors.black,)
               ),);
             }),
              separatorBuilder: (((context, index) {
          return Divider(height: 4,thickness: 1,color:Color.fromRGBO(146, 183, 192, 0.8),);
              })),
               itemCount: entries.length),
          ),
        )
     ],
    ),
    );
    
  }
}