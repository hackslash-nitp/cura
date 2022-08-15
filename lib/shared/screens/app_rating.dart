import 'package:cura/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRating extends StatefulWidget {
  const AppRating({Key? key}) : super(key: key);

  @override
  State<AppRating> createState() => _AppRatingState();
}

class _AppRatingState extends State<AppRating> {
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(11.w, 25.w, 11.w, bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: const AssetImage(
                        'assets/startup_assets/create_account_assets/profile_primary.png'),
                    height: 67.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: const AssetImage(
                              'assets/main_assets/feedback.png'),
                          height: 363.h,
                          width: 392.w,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            getStarWidget(),
                            getStarWidget(),
                            getStarWidget(),
                            getStarWidget(),
                            getStarWidget(),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          height: 160.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDECEC),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(17.w, 1.h, 9.w, 0),
                            child: TextField(
                              maxLength: 200,
                              controller: _commentController,
                              keyboardType: TextInputType.multiline,
                              expands: true,
                              decoration: const InputDecoration(
                                hintText: "Write your comments here....",
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            getMainButton("Later", const Color(0xFFC8DBE0),
                                const Color(0xFF000000), () {
                              Navigator.of(context).pop();
                            }),
                            getMainButton("Submit", const Color(0xFF729CA3),
                                const Color(0xFFFFFFFF), () {
                              if (_commentController.text.trim().isNotEmpty) {
                                print("Submitted Succesfully!");
                              } else {
                                CustomSnackbar.showSnackBar(
                                    context,
                                    "Please enter your feedback",
                                    Colors.redAccent);
                              }
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox getMainButton(String text, Color backgroundColor, Color textColor,
      void Function()? onPressed) {
    return SizedBox(
      width: 144.w,
      height: 55.h,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 10,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 27.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Image getStarWidget() {
    return Image(
      image: const AssetImage('assets/main_assets/star.png'),
      width: 50.w,
      height: 50.h,
    );
  }
}
