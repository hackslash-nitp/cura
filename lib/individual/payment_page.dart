import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6CAFB4),
                    Colors.white,
                    Colors.white,
                    Color(0xFF6CAFB4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.w,
                          ),
                          onPressed: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(110.w, 0, 0, 0),
                          child: Expanded(
                            child: Text(
                              "Payment",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.w,
                                  fontWeight: FontWeight.w500),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.w, 5.h, 0, 0),
                        child: Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.w, 2.h, 0, 0),
                        child: Text(
                          "Rs 1000", //total amount to be fetched from donation page
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 118, 175, 182),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(60.w, 40.h, 0, 0),
                        child: Text(
                          "UPI",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.w, 5.h, 35.w, 5.h),
                        child: Container(
                          height: 160.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 176, 229, 233),
                                width: 2.w),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 150.w,
                                      height: 60.h,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          primary: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 154, 216, 221),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Paypal",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150.w,
                                      height: 60.h,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          primary: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 72, 117, 122),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Credit",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 150.w,
                                      height: 60.h,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          primary: Colors.white,
                                          backgroundColor: Color.fromARGB(
                                              255, 154, 216, 221),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Google pay",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150.w,
                                      height: 60.h,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          primary: Colors.white,
                                          backgroundColor:
                                              Color.fromARGB(255, 72, 117, 122),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Paytm",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
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
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.w, 20.h, 0, 5.h),
                        child: Text(
                          "Card Number",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                    child: Container(
                      height: 60.h,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 120, 194, 204),
                                width: 3.w),
                          ),
                          hintText: "Enter Card Number",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.w, 10.h, 150.w, 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Valid Until",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Cvv",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.w, 0, 85.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50.h,
                          width: 130.w,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 120, 194, 204),
                                    width: 3.w),
                              ),
                              hintText: "MM/YYYY",
                            ),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 100.w,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 120, 194, 204),
                                    width: 3.w),
                              ),
                              hintText: "XXX",
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.w, 20.h, 0, 0),
                        child: Text(
                          "Card holder",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 5.h, 30.w, 0),
                    child: Container(
                      height: 60.h,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 120, 194, 204),
                                width: 3.w),
                          ),
                          hintText: "Full Name of card holder",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35.w, 40.h, 35.w, 10.h),
                    child: Container(
                      height: 50.w,
                      width: 400.w,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          primary: Color.fromARGB(255, 8, 134, 104),
                          backgroundColor: Color.fromARGB(255, 110, 159, 165),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Proceed to Confirm",
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
          ),
        ),
      ),
    );
  }
}
