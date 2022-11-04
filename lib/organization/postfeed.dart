import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:cura/individual/home_page_individual.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_share/social_share.dart';

class postfeed extends StatefulWidget {
  static const String routeName = '/postfeed';
  const postfeed({Key? key}) : super(key: key);

  @override
  State<postfeed> createState() => _postfeedState();
}

class _postfeedState extends State<postfeed> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Scaffold(
              bottomNavigationBar: const CustomNavigationBar(currentIndex: 1),
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
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Row(children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 15.w,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(HomePageIndividual.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(110.w, 0, 0, 0),
                            child: Expanded(
                              child: Text(
                                "Posts Feed",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 44.h,
                          ),
                          Image.asset('assets/preview1.png',
                              height: 45.h, width: 45.w),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(children: [
                            Text(
                              "Younity Foundation ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16.sp),
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
                          Container(
                              width: 372.w,
                              child: Image.asset(
                                'assets/children.png',
                                // height: 222.h, width: 400.w),
                              )),
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
                                  FavoriteButton(
                                    iconSize: 60.r,
                                    valueChanged: (_) {},
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Icon(Icons.comment),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.share),
                                      onPressed: () {
                                        SocialShare.shareOptions("Hello world",
                                            imagePath: 'imagepath');
                                      }),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 44.h,
                          ),
                          Image.asset('assets/Ellipse4.png',
                              height: 45.h, width: 45.w),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(children: [
                            Text(
                              "Helping Hands ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16.sp),
                            ),
                            Text(
                              "27 june 2022  8:00 AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12.sp),
                            ),
                          ]),

                          SizedBox(
                            width: 165.w,
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
                          Container(
                              width: 372.w,
                              child: Image.asset(
                                'assets/old-people.png',
                                // height: 222.h, width: 400.w),
                              )),
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
                                  FavoriteButton(
                                    iconSize: 60.r,
                                    valueChanged: (_) {},
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Icon(Icons.comment),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.share),
                                      onPressed: () {
                                        SocialShare.shareOptions("Hello world",
                                            imagePath: 'imagepath');
                                      }),
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
                ),
              )),
            ));
  }
}
