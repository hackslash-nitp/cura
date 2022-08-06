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
      appBar: AppBar(
        title: const Text(
          'Profile Setup',
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold, color: Colors.black, height: 24),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 5, 0, 0),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('lib/assets/Vectorprofilepic.png')),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 101, 167, 221),
                Colors.white,
              ], stops: [
                0.1,
                1.00
              ], begin: Alignment.topCenter, end: Alignment.center),
            ),
            padding:
                const EdgeInsets.only(right: 32.99, top: 151, left: 187.01),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.cyan.shade100,
                      filled: true,
                      hintText: 'Upload Profile Picture',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //         child: ListView(
                //       children: [
                //         TextField(
                //           decoration: InputDecoration(
                //               fillColor: Colors.cyan.shade100,
                //               filled: true,
                //               hintText: 'From Gallery',
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //         ),
                //         TextField(
                //           decoration: InputDecoration(
                //               fillColor: Colors.cyan.shade100,
                //               filled: true,
                //               hintText: 'Take Now',
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //         ),
                //       ],
                //     ))
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 32, top: 265, left: 200),
            child: Text(
              'Enter Organisation Details',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(right: 31, top: 322, left: 32),
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
                    height: 80,
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
                    height: 80,
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
                    height: 80,
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
                    height: 80,
                  ),
                  Text(
                    'Organisation Type',
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
                    height: 80,
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
                    height: 80,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.cyan.shade100,
                        filled: true,
                        hintText: 'Enter Your Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 80,
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
                  Text('Establishment Date'),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.cyan.shade100,
                        filled: true,
                        hintText: 'DD/MM/YYYY',
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(23, 12, 66, 5),
                        suffixIcon: Icon(Icons.attach_file_rounded),
                        suffixIconColor: Colors.black,
                        fillColor: Colors.cyan.shade100,
                        filled: true,
                        hintText:
                            'Upload Organisation Authenticty Certificate Issued by Government',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  Row(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(right: 61, top: 788, left: 62),
                    ),
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
                  ]),
                  Column(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.only(right: 150, top: 707, left: 56),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'File must be in PDF format of <= 3mb',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_left),
        ],
      ),
    );
  }
}
