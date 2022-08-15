import 'package:cura/shared/widgets/message_dialog.dart';
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
  int _appRating = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
                            getStarWidget(1),
                            getStarWidget(2),
                            getStarWidget(3),
                            getStarWidget(4),
                            getStarWidget(5),
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
                              if (_commentController.text.trim().isNotEmpty &&
                                  _appRating > 0) {
                                //backend implementation for storing review to be implemented later
                                showDialog(
                                    builder: (context) => const MessageDialog(
                                        title: "Thank You!",
                                        imageUrl:
                                            "assets/main_assets/Completed.png",
                                        contentText:
                                            "Thank you for sharing your valuable comments and rating us!"),
                                    context: context);
                                setState(() {
                                  //to reset the UI once the review has been submitted.
                                  _appRating = 0;
                                  _commentController.text = "";
                                });
                              } else {
                                CustomSnackbar.showSnackBar(
                                    context,
                                    "Please enter proper feedback",
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

  Widget getStarWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _appRating = index;
        });
      },
      child: Image(
        image: const AssetImage('assets/main_assets/star.png'),
        color: index <= _appRating ? Color.fromARGB(255, 197, 184, 61) : null,
        width: 50.w,
        height: 50.h,
      ),
    );
  }
}
