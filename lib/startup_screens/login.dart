import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/gradient_background.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController inputText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  String? dropDownValue = "+91";
  List<String> items = [
    "+91",
    "+01",
    "+51",
  ];

  Color? primaryColor = const Color(0xFF729CA3);
  Color? secondaryColor = const Color(0xFFA2D2D5);

  bool isPhoneVerification = true;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        body: Stack(
          children: [
            const GradientBackground(),
            SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 15.h,
                            )),
                        Text(
                          isLogin ? "Log In" : "Sign Up",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 44.h,
                          ),
                          Image.asset('assets/cura_logo.png',
                              height: 160.h, width: 256.w),
                          Text(
                            "Hello! ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                          Text(
                            "Welcome Back to Cura",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 55.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 141.w,
                                decoration: BoxDecoration(
                                  color: isPhoneVerification
                                      ? primaryColor
                                      : secondaryColor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                          topStart: Radius.circular(10),
                                          bottomStart: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isPhoneVerification = true;
                                    });
                                  },
                                  child: Text(
                                    "Phone No.",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40.h,
                                width: 141.w,
                                decoration: BoxDecoration(
                                  color: isPhoneVerification
                                      ? secondaryColor
                                      : primaryColor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(10),
                                          bottomEnd: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isPhoneVerification = false;
                                    });
                                  },
                                  child: Text(
                                    "Email",
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
                            height: 22.h,
                          ),
                          isPhoneVerification
                              ? phoneInputField()
                              : emailInputField(),
                          SizedBox(
                            height: 40.h,
                          ),
                          TextField(
                            controller: inputText,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.w),
                              label: Text(
                                "OTP: ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("OTP has been resent")),
                                  );
                                },
                                iconSize: 25.h,
                                icon: Column(
                                  children: [
                                    const Icon(Icons.refresh),
                                    Text(
                                      "Resend",
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ],
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          Container(
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: primaryColor,
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                isLogin ? "LOG IN" : "SIGN UP",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            isLogin ? "New User?" : "Existing User?",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: const Color(0xFF006FF0)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Text(
                                isLogin ? "Sign Up Now" : "Log In Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: const Color(0xFF006FF0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField emailInputField() {
    return TextField(
      controller: inputText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: const Icon(Icons.email_outlined),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: 'yourmail@gmail.com',
      ),
    );
  }

  TextField phoneInputField() {
    return TextField(
      controller: inputText,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: DropdownButton(
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(5.r),
            value: dropDownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue;
              });
            },
            items: items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: '99999 99999',
      ),
    );
  }
}
