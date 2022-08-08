import 'package:flutter/material.dart';
import 'splash_screen1_3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
          body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/cura_logo.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: const AssetImage(
                              "assets/startup_assets/preview_splash_assets/Group 43.png"),
                          width: 400.w,
                          height: 450.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image(
                      filterQuality: FilterQuality.high,
                      image: AssetImage(
                        'assets/startup_assets/preview_splash_assets/Ellipse.png',
                      ),
                      width: 200.w,
                      // height: 57.h,
                    ),
                    Container(
                      width: 250.w,
                      height: 57.h,
                      child: Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 137, 184, 189),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ));
                          },
                          child: Text(
                            "GET STARTED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
