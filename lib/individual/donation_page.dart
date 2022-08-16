import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isChecked = false;

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
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                size: 15.w,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(110.w, 0, 0, 0),
                            child: Text(
                              "Donation",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.w,
                                  fontWeight: FontWeight.w500),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: double.infinity,
                  ),
                  Container(
                    height: 250.sp,
                    width: double.infinity,
                    child: const Image(
                        filterQuality: FilterQuality.high,
                        image: AssetImage(
                          'assets/startup_assets/individual_assets/donation.png',
                        ),
                        width: double.infinity),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 176, 229, 233),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      width: double.infinity,
                      height: 110.sp,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      35.w, 10.h, 10.w, 10.h),
                                  child: Text(
                                    "Enter the Amount",
                                    style: TextStyle(
                                        fontSize: 18.w,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(255, 172, 220, 226),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 2.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 120, 194, 204),
                                        width: 3.w),
                                  ),
                                  hintText: 'Amount',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(40.w, 10.w, 10.w, 10.w),
                                child: Text(
                                  "To",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                              child: SearchField(
                                hint: " Enter oranisarion's name",
                                suggestions: const [
                                  'Organiation 1',
                                  'Organiation 2',
                                  'Organiation 3',
                                  'Organiation 4',
                                  'Organiation 5',
                                  'Organiation 6',
                                ],
                                searchInputDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.w),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 137, 184, 189),
                                        width: 2.w),
                                  ),
                                  fillColor: Color.fromARGB(255, 186, 231, 235),
                                  filled: true,
                                  suffixIcon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(40.w, 10.h, 10.w, 10.h),
                                child: Text(
                                  "Address",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                              child: SearchField(
                                hint: "Enter Oranisarion's Address",
                                suggestions: const [
                                  'United States',
                                  'America',
                                  'Washington',
                                  'India',
                                  'Paris',
                                  'Jakarta',
                                  'Australia',
                                  'Lorem Ipsum'
                                ],
                                searchInputDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.w),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 137, 184, 189),
                                        width: 2.w),
                                  ),
                                  fillColor: Color.fromARGB(255, 186, 231, 235),
                                  filled: true,
                                  suffixIcon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 0, 0, 5.h),
                          child: Text(
                            "Donate as Anonymous",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 45.w,
                    width: 200.w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        primary: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 137, 184, 189),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
