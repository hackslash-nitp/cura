import 'package:cura/startup_screens/preview_page.dart';
import 'package:flutter/material.dart';

import 'splash_slide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  bool isLastPage = false;
  List<Map<String, String>> splashContent = [
    {
      "imgUrl": "assets/startup_assets/preview_splash_assets/Group 40.png",
      "title1": "Cura ",
      "title2": "is about care",
      "text": "Donate easily,quickly,right on the target all over the world",
    },
    {
      "imgUrl": "assets/startup_assets/preview_splash_assets/Group 41.png",
      "title1": "Together, ",
      "title2": "we can grow",
      "text": "Create your own fundraising and publish it to the world.",
    },
    {
      "imgUrl": "assets/startup_assets/preview_splash_assets/Group 42.png",
      "title1": "Trusted, ",
      "title2": '''transparent
fundraising.''',
      "text":
          "Grow online donations ,track your suppoters,host an event,deep-dive into metrics and more",
    }
  ];
  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (BuildContext context, Widget? child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 15,
                    ),
                    onPressed: () {
                      if (currentPage == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviewPage(),
                          ),
                        );
                      } else {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(87, 219, 246, 248),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(
                              color: const Color.fromARGB(103, 162, 221, 241),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: const Color(0xFF645B5B),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                        softWrap: true,
                      )),
                ],
              ),
              SizedBox(height: 78.h),
              Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                        if (currentPage == 2) {
                          setState(() {
                            isLastPage = true;
                          });
                        } else {
                          isLastPage = false;
                        }
                      });
                    },
                    itemCount: splashContent.length,
                    itemBuilder: (context, index) => SplashSlide(
                      imgUrl: splashContent[index]["imgUrl"]!,
                      headTitle1: splashContent[index]["title1"]!,
                      headTitle2: splashContent[index]["title2"]!,
                      text: splashContent[index]["text"]!,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashContent.length, (index) => buildDot(index)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: isLastPage
                            ? TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  primary: Colors.white,
                                  backgroundColor:
                                      const Color.fromARGB(255, 127, 176, 176),
                                ),
                                onPressed: () {},
                                // async {
                                //   Navigator.of(context)
                                //       .pushReplacement(MaterialPageRoute(
                                //     builder: ((context) => LoginStudent()),
                                //   ));
                                // },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 34.w),
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    print(isLastPage);
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 50.r,
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 108, 166, 170),
                                ),
                              ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 8,
        width: currentPage == index ? 8 : 8,
        decoration: BoxDecoration(
          color: currentPage == index
              ? Color.fromARGB(255, 57, 121, 125)
              : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
