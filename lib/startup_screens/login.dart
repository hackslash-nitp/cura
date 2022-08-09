import 'package:cura/individual/home_page_individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/gradient_background.dart';
import '../shared/services/firebase_authentication.dart';

bool _isLoading = false;

void setOtp(String smsCode) {
  passwordText.text = smsCode;
}

void showErrorDialog(BuildContext context, String message) {
  _isLoading = false;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error signing in"),
          content: Text(message),
          actions: [
            OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"))
          ],
        );
      });
}

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return const HomePageIndividual();
  }));
}

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

TextEditingController inputText = TextEditingController();
TextEditingController passwordText = TextEditingController();

class _UserLoginState extends State<UserLogin> {
  FirebaseAuthentication auth = FirebaseAuthentication();
  String? _inputValue, _password;

  String? dropDownValue = "+91";
  List<String> items = [
    "+91",
    "+01",
    "+51",
  ];

  final Color _primaryColor = const Color(0xFF729CA3);
  final Color _secondaryColor = const Color(0xFFA2D2D5);

  bool _isPhoneVerification = true;
  bool _isLogin = true;

  @override
  void initState() {
    inputText.text = "";
    passwordText.text = "";
    super.initState();
  }

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
                          _isLogin ? "Log In" : "Sign Up",
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
                                  color: _isPhoneVerification
                                      ? _primaryColor
                                      : _secondaryColor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                          topStart: Radius.circular(10),
                                          bottomStart: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPhoneVerification = true;
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
                                  color: _isPhoneVerification
                                      ? _secondaryColor
                                      : _primaryColor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(10),
                                          bottomEnd: Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPhoneVerification = false;
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
                          _isPhoneVerification
                              ? phoneInputField()
                              : emailInputField(),
                          SizedBox(
                            height: 40.h,
                          ),
                          _isPhoneVerification
                              ? passField(context, "OTP: ")
                              : passField(context, "Password: "),
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
                                setState(() {
                                  _isLoading = true;
                                });
                                if (_isPhoneVerification) {
                                  if (_inputValue == null) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    showSnackBar(
                                        context,
                                        "Please enter phone number",
                                        const Color.fromARGB(
                                            255, 219, 112, 112));
                                    return;
                                  }
                                  await auth.loginUserWithPhoneNumber(
                                      "$dropDownValue$_inputValue", context);
                                } else if (_inputValue != null &&
                                    _password != null) {
                                  if (_isLogin) {
                                    await auth.loginUserWithEmail(
                                        _inputValue!, _password!, context);
                                  } else {
                                    await auth.signupUser(
                                        _inputValue!, _password!, context);
                                  }
                                } else {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  showSnackBar(
                                      context,
                                      "Please fill all the fields",
                                      Colors.redAccent);
                                }
                              },
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    )
                                  : Text(
                                      _isPhoneVerification
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
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: const Color(0xFF006FF0)),
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

  void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  TextField passField(BuildContext context, String text) {
    return TextField(
      controller: passwordText,
      keyboardType: _isPhoneVerification
          ? TextInputType.number
          : TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _password = value.trim();
        });
      },
      obscureText: true,
      maxLength: _isPhoneVerification ? 6 : null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        label: Text(
          text,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        suffixIcon: _isPhoneVerification
            ? IconButton(
                onPressed: () =>
                    showSnackBar(context, "OTP has been resent", Colors.black),
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
              )
            : SizedBox(),
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
