import 'package:cura/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/widgets/gradient_background.dart';
import '../shared/services/firebase_authentication.dart';

late TextEditingController _otpController;

class Otp {
  final String otp;
  Otp({required this.otp});

  void setOtp() {
    _otpController.text = otp;
  }
}

class UserLogin extends StatefulWidget {
  static const String routeName = '/UserLogin';
  final bool isPhoneLogin;
  const UserLogin({Key? key, required this.isPhoneLogin}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState(isPhoneVerification: isPhoneLogin);
}

class _UserLoginState extends State<UserLogin> {
  FirebaseAuthentication auth = FirebaseAuthentication();

  String? _inputValue, _password;
  String? _dropDownValue = "+91";
  List<String> items = [
    "+91",
    "+01",
    "+51",
  ];

  final Color _primaryColor = const Color(0xFF729CA3);
  final Color _secondaryColor = const Color(0xFFA2D2D5);

  TextEditingController inputText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  bool isPhoneVerification;
  bool _isLogin = true;

  _UserLoginState({required this.isPhoneVerification});

  @override
  void dispose() {
    inputText.dispose();
    passwordText.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        body: Stack(
          children: [
            const BiDirectionalBackground(),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 44.h,
                          ),
                          Image.asset('assets/cura_logo.png', height: 160.h, width: 256.w),
                          Text(
                            "Hello! ",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                          Text(
                            "Welcome Back to Cura",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
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
                                  color: isPhoneVerification ? _primaryColor : _secondaryColor,
                                  borderRadius: const BorderRadiusDirectional.only(
                                      topStart: Radius.circular(10), bottomStart: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
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
                                  color: isPhoneVerification ? _secondaryColor : _primaryColor,
                                  borderRadius: const BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(10), bottomEnd: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
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
                          isPhoneVerification ? phoneInputField() : emailInputField(),
                          SizedBox(
                            height: 40.h,
                          ),
                          isPhoneVerification ? passField(context, "OTP: ") : passField(context, "Password: "),
                          SizedBox(
                            height: 21.h,
                          ),
                          Container(
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: _primaryColor,
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                if (isPhoneVerification) {
                                  if (_inputValue == null) {
                                    CustomSnackbar.showSnackBar(
                                        context, "Please enter phone number", const Color.fromARGB(255, 219, 112, 112));
                                    return;
                                  }
                                  await auth.loginUserWithPhoneNumber("$_dropDownValue$_inputValue", context, _isLogin);
                                } else if (_inputValue != null && _password != null) {
                                  if (_isLogin) {
                                    await auth.loginUserWithEmail(_inputValue!, _password!, context);
                                  } else {
                                    await auth.signupUser(_inputValue!, _password!, context);
                                  }
                                } else if (_password!.length < 6) {
                                  CustomSnackbar.showSnackBar(
                                      context, "Password should be atleast 6 characters long", Colors.redAccent);
                                } else {
                                  CustomSnackbar.showSnackBar(context, "Please fill all the fields", Colors.redAccent);
                                }
                              },
                              child: Text(
                                isPhoneVerification
                                    ? "GET OTP"
                                    : _isLogin
                                        ? "LOG IN"
                                        : "SIGN UP",
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
                            _isLogin ? "New User?" : "Existing User?",
                            style:
                                TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp, color: const Color(0xFF006FF0)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Text(
                                _isLogin ? "Sign Up Now" : "Log In Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14.sp, color: const Color(0xFF006FF0)),
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

  TextField passField(BuildContext context, String text) {
    return TextField(
      controller: isPhoneVerification ? _otpController : passwordText,
      keyboardType: isPhoneVerification ? TextInputType.number : TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _password = value.trim();
        });
      },
      obscureText: !isPhoneVerification,
      maxLength: isPhoneVerification ? 6 : null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        label: Text(
          text,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        suffixIcon: isPhoneVerification
            ? IconButton(
                onPressed: () => CustomSnackbar.showSnackBar(context, "OTP has been resent", Colors.black),
                iconSize: 25.h,
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: Icon(Icons.refresh)),
                    Text(
                      "Resend",
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ],
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  TextField emailInputField() {
    return TextField(
      controller: inputText,
      onChanged: (value) {
        setState(() {
          _inputValue = value.trim();
        });
      },
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
      onChanged: (value) {
        _inputValue = value.trim();
      },
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
            value: _dropDownValue,
            onChanged: (String? newValue) {
              setState(() {
                _dropDownValue = newValue;
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
