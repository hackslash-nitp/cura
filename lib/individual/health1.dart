// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cura/main.dart';
import 'package:searchfield/searchfield.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';

class health1 extends StatefulWidget {
  const health1({Key? key}) : super(key: key);

  @override
  State<health1> createState() => _health1State();
}

class _health1State extends State<health1> {
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
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.all(0.5.sp),
                    // height: 100.h,
                    // width: 350.w,
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
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 0),
                    child: Column(
                      children: [
                        Image.asset('assets/health1.png',
                            width: double.infinity),
                        Container(
                          height: 370.h,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp),
                                    ),
                                    // SizedBox(
                                    //   width: 130.w,
                                    // ),
                                    // Text(
                                    //   "Time",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 20.sp),
                                    // ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    // SizedBox(
                                    //   height: 10.h,
                                    // )
                                    //
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            fillColor: const Color.fromARGB(
                                                255, 186, 231, 235),
                                            filled: true,
                                            suffixIcon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                              size: 40,
                                            ),
                                            hintText: 'Date',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2.w),
                                                borderRadius:
                                                    BorderRadius.circular(80))),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Type of health checkup ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                    ),
                                    Expanded(
                                        child: TextField(
                                            decoration: InputDecoration(
                                                fillColor: const Color.fromARGB(
                                                    255, 186, 231, 235),
                                                filled: true,
                                                suffixIcon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                  size: 40,
                                                ),
                                                hintText:
                                                    'type of health checkup',
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 2.w),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80)))))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: 
                    [TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        primary: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 137, 184, 189),
                      ),
                      onPressed: () {},
                      child: Text(
                        "submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                                )


                              ]),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ))));
  }
}
