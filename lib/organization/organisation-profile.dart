import 'package:cura/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class organisationprofile extends StatefulWidget {
  const organisationprofile({Key? key}) : super(key: key);

  @override
  State<organisationprofile> createState() => _organisationprofile();
}

class _organisationprofile extends State<organisationprofile> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
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
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Row(children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.w,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 290.w,
                        ),
                        Icon(Icons.more_vert),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          //
                        ),
                        Image.asset('assets/image1.png',
                            height: 120.h, width: 120.w),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(children: [
                          Text(
                            "Care & Love ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 30.sp),
                          ),
                          Text(
                            "Orphanage",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 30.sp),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 107, 187, 193),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              "Messsage Us",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 107, 187, 193),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              "Donate Us",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),




                    const Divider(
   thickness: 1, // thickness of the line
   indent: 10, // empty space to the leading edge of divider.
   endIndent: 10, // empty space to the trailing edge of the divider.
   color: Colors.black, // The color to use when painting the line.
   height: 10, // The divider's height extent.
 ),

 SizedBox(
                      height: 10.h,
                    ),

                    Column(
                      children: [
                        Container(
                          height: 40.h,
                          width: 365.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 107, 187, 193),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              "Posts & Activities",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 44.h,
                        ),
                         SizedBox(
                          width: 10.w,
                        ),
                        Image.asset('assets/image1.png',
                            height: 45.h, width: 45.w),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(children: [
                          Text(
                            "Care & Love",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.sp),
                          ),
                          Text(
                            "27 june 2022  8:00 AM",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                        ]),

                        SizedBox(
                          width: 155.w,
                        ),

                        Icon(Icons.more_vert),
                        //three dot
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset('assets/children.png',
                            height: 222.h, width: 381.w),
                        Container(
                          height: 50.h,
                          width: 372.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF6CAFB4),
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite),
                                SizedBox(
                                  width: 80.w,
                                ),
                                Icon(Icons.comment),
                                SizedBox(
                                  width: 80.w,
                                ),
                                Icon(Icons.share),
                              ]),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "lorem ipsum dolor sit amet, consectetur adipis elit.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ]),
                ),
              )),
              bottomNavigationBar: BottomNavigationBar(items: [
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
                  icon: Icon(Icons.chat_bubble_outline),
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
