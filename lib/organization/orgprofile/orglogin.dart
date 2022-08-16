import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Orglogin extends StatefulWidget {
  const Orglogin({Key? key}) : super(key: key);

  @override
  State<Orglogin> createState() => _OrgloginState();
}

class _OrgloginState extends State<Orglogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0.00,backgroundColor: Colors.transparent ,iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(onPressed: ()=>{}, icon: Icon(Icons.keyboard_arrow_left),
      color: Colors.black,),
        title: const Text('Profile Setup',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage('assets/profilepic.png')),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 101, 167, 221),
              Colors.white,
            ], stops: [
              0.1,
              1.00
            ], begin: Alignment.topCenter, end: Alignment.center),
          ),
        ),
        Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(right: 32.99, top: 125, left: 187.01),
              child: Column(
                children: [
                   RaisedButton(onPressed: ()=>{}, child: Text('   Upload Profile Picture   '),
                  color: Colors.cyan.shade100,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),),
                  const SizedBox(
                    height: 24,
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  RaisedButton(onPressed: ()=>{}, child: Text('from Gallery'),
                  color: Colors.cyan.shade100,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),),
                  RaisedButton(onPressed: ()=>{}, child: Text('take Now'),
                  color: Colors.cyan.shade100,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 32, top: 15),
              child: Text(
                'Enter Organisation Details',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            const Divider(height: 5,thickness: 1,color: Colors.grey,),
            Container(
              padding: const EdgeInsets.only(right: 31, top: 30, left: 32),
              height: 400,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Organisation Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Organisation Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Organisation Contact Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Organisation Registration Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Organisation Type',textAlign: TextAlign.left,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                          suffixIconColor: Colors.black,
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Select',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter your Country',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(maxLines: 5,minLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Your Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'Enter Your Pincode',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                     const SizedBox(
                      height: 40,
                    ),
                    Text('Establishment Date'),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText: 'DD/MM/YYYY',
                          suffixIcon: Icon(Icons.calendar_month_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ), const SizedBox(
                      height: 40,
                    ),
                    TextField(maxLines:2,minLines:1,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(23, 12, 66, 5),
                          suffixIcon: Icon(Icons.attach_file_rounded),
                          suffixIconColor: Colors.black,
                          fillColor: Colors.cyan.shade100,
                          filled: true,
                          hintText:
                              'Upload Organisation Authenticty \nCertificate Issued by Government',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(children: [
                      FlatButton(
                        padding: EdgeInsets.fromLTRB(125, 5, 126, 6),
                        onPressed: () {},
                        color: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(fontSize: 31, color: Colors.black),
                        ),
                      ),
                      Text(
                          '*File must be in PDF format of <= 3mb',
                          style: TextStyle(color: Colors.red),
                        ),
                    ],),
                  ],
                ),
              ), 
            ),
          ],
        ),
      ]),
    );
  }
}