import 'package:cura/startup_screens/login.dart';
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
                    IntroRoutingComponent(
                      icon: Icons.email_rounded,
                      text: "Email",
                      isEmail: true,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const UserLogin(isPhoneLogin: false)));
                      },
                    ),
                    const Spacer(),
                    IntroRoutingComponent(
                      icon: Icons.phone,
                      text: "Phone",
                      isEmail: false,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const UserLogin(isPhoneLogin: true)));
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => termsDialog);
                      },
                      child: SizedBox(
                        width: 500.w,
                        height: 50.h,
                        child: Center(
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF92B7C0),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            )));
  }
}

class IntroRoutingComponent extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onTap;
  final bool isEmail;

  final primaryColor = const Color(0xFF92B7C0);

  const IntroRoutingComponent(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.isEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: isEmail ? primaryColor : Colors.white,
            border:
                isEmail ? null : Border.all(color: primaryColor, width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 30.w,
              color: isEmail ? Colors.white : primaryColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: isEmail ? Colors.white : primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

Dialog termsDialog = Dialog(
  elevation: 2,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
  child: Container(
      height: 512.h,
      width: 380.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              "TERMS & CONDITIONS",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF343030),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[],
            ),
          ),
          const Spacer()
        ],
      )),
);
