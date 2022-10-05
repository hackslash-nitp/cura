import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
                onPressed: (() => Navigator.of(context).pop()),
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    SizedBox(
                      height: 100.h,
                      width: 230.w,
                      child: Stack(
                        children: <Widget>[
                          const Image(
                            alignment: Alignment.topLeft,
                            image: AssetImage(
                                "assets/startup_assets/preview_splash_assets/star.png"),
                          ),
                          Center(
                            child: Text(
                              "Welcome!",
                              style: TextStyle(
                                  fontSize: 36.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Image(
                            alignment: Alignment.bottomRight,
                            image: AssetImage(
                                "assets/startup_assets/preview_splash_assets/star.png"),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image(
                      image: const AssetImage("assets/Group 44.png"),
                      width: 300.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFF92B7C0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.email_rounded,
                              size: 30.w,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: const Color(0xFF92B7C0), width: 1),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 30.w,
                              color: const Color(0xFF92B7C0),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text("Phone",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF92B7C0),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    RichText(
                        text: TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF92B7C0),
                                fontWeight: FontWeight.w500),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("T&C");
                              })),
                    const Spacer()
                  ],
                ),
              ),
            )));
  }
}
