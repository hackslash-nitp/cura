import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDonationsScreen extends StatefulWidget {
  const MyDonationsScreen({Key? key}) : super(key: key);

  @override
  State<MyDonationsScreen> createState() => _MyDonationsScreenState();
}

class _MyDonationsScreenState extends State<MyDonationsScreen> {
  final List<String> _donations = ["Donation1", "Donation2", "Donation3"];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 14.w,
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {},
                    ),
                    Text(
                      "My Donations",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    )
                  ]),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: Image(
                  image: const AssetImage("assets/main_assets/donate.png"),
                  width: 385.w,
                  height: 194.h,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0EEEF),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              _donations.length.toString(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Total Donations",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "DONATION",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                "DATE",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                "STATUS",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 400.h,
                            child: ListView.builder(
                                itemCount: _donations.length,
                                itemBuilder: (context, index) {
                                  return MyDonationInfo(
                                    index: index,
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDonationInfo extends StatelessWidget {
  final int index;

  const MyDonationInfo({Key? key, required this.index}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(9.w, 23.h, 9.w, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.currency_rupee,
                    size: 20.w,
                  ),
                  Text(
                    "2500.0",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                "March 18, 2021\n12:39 PM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 12.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0803FF),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE0EEEF),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: GestureDetector(
              onTap: () {
                print("Receipt tapped: #$index");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("View Receipt",
                      style: TextStyle(
                        color: const Color(0xFF0803FF),
                        fontSize: 18.sp,
                      )),
                  const Icon(
                    Icons.arrow_right,
                    color: Color(0xFF0803FF),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: const Color(0xFFD9D9D9),
            thickness: 5.h,
          )
        ],
      ),
    );
  }
}
