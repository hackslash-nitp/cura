import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDialog extends StatelessWidget {
  final String title, imageUrl, contentText;
  const MessageDialog(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.contentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => SafeArea(
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: 500.h,
              width: 384.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF6FAFA),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(imageUrl),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFFC8D8E0),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      contentText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
