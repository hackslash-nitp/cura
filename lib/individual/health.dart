<<<<<<< HEAD


import 'package:flutter/material.dart';
import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:cura/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';
// import 'package:searchfield/searchfield.dart';

class health extends StatefulWidget {
  const health({Key? key}) : super(key: key);

  @override
  State<health> createState() => _healthState();
}

class _healthState extends State<health> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Scaffold(
              body: SafeArea(
                  child: SizedBox(
                width: double.infinity,
                child: Container(
                    decoration: const BoxDecoration(
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
                    child: Stack(
                      children: [
                        Container(
                            child: Column(children: [
                          Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Row(children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 15.w,
                                ),
                                onPressed: () {},
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(110.w, 0, 0, 0),
                                child: Expanded(
                                  child: Text(
                                    "Health",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25.w,
                                        fontWeight: FontWeight.w500),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ]),
                          ),

                          // SizedBox(
                          //   height: 5.h,
                          // ),
                        ])),
                        Container(
                            child: Column(children: [
                          Image.asset('assets/health1.png',
                              width: double.infinity)
                      ],),),
                        
                        Container(
                          // children:[
                          height: 350.h,
                          width: 330.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 215, 246, 248),
                            borderRadius: BorderRadius.circular(10.r),
                         
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Select Organization",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                // SizedBox(
                                //   height: 10.h,
                                // )
                                //
                                // children:[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                  child: SearchField(
                                    hint: "Enter Organization's name",
                                    suggestions: const [
                                      'organization 1',
                                      'organization 2',
                                      'organization 3',
                                      'organization 4',
                                      'organization 5',
                                      'organization 6',
                                    ],
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.w),
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 137, 184, 189),
                                            width: 2.w),
                                      ),
                                      fillColor: const Color.fromARGB(
                                          255, 186, 231, 235),
                                      filled: true,
                                      suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),


                                Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ Text(
                                  "Select Organization",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                // SizedBox(
                                //   height: 10.h,
                                // )
                                //
                                // children:[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                  child: SearchField(
                                    hint: "Enter Organization's name",
                                    suggestions: const [
                                      'organization 1',
                                      'organization 2',
                                      'organization 3',
                                      'organization 4',
                                      'organization 5',
                                      'organization 6',
                                    ],
                                    searchInputDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.w),
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 137, 184, 189),
                                            width: 2.w),
                                      ),
                                      fillColor: const Color.fromARGB(
                                          255, 186, 231, 235),
                                      filled: true,
                                      suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),

                              ],

                                )
                              ]),


                              
                         )



                          ]
                           // ]
                        ),
                        )
                      // ],
                      
                    )
                    ),
              )
            );
=======
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
>>>>>>> 5bde0a63adc39c18c4d6fd8f94346537afb47bf0
  }
}
