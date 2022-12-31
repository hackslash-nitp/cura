import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';

class HealthPage extends StatefulWidget {
  static const String routeName = '/HealthPage';
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 30);

  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
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
                )),
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.all(0.5.sp),
                    // height: 100.h,
                    // width: 350.w,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Row(children: [
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
                                "Health",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.w,
                                    fontWeight: FontWeight.w500),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 0),
                    child: Column(
                      children: [
                        Image.asset('assets/health1.png',
                            width: double.infinity),
                        Container(
                          height: 400.h,
                          width: 330.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 215, 246, 248),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Select Organization",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                  child: SearchField(
                                    hint: "Enter Organization's name",
                                    suggestions: const [
                                      'organization 1',
                                      'organization 2',
                                      'organization 3',
                                      'organization 4',
                                      'organization 5',
                                      'organization 6',
                                    ],
                                    searchInputDecoration: InputDecoration(
                                      // ignore: prefer_const_constructors
                                      contentPadding: EdgeInsets.only(
                                          top: 0, bottom: 0, left: 5, right: 0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.w),
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.r),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 137, 184, 189),
                                            width: 2.w),
                                      ),
                                      fillColor: const Color.fromARGB(
                                          255, 186, 231, 235),
                                      filled: true,
                                      suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: _date,
                                        decoration: InputDecoration(
                                            // ignore: prefer_const_constructors
                                            contentPadding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                                left: 5,
                                                right: 0),
                                            fillColor: const Color.fromARGB(
                                                255, 186, 231, 235),
                                            filled: true,
                                            suffixIcon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                            hintText: 'Date',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2.w),
                                                borderRadius:
                                                    BorderRadius.circular(80))),
                                        onTap: () async {
                                          DateTime? pickeddate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2101));
                                          if (pickeddate != null) {
                                            setState(() {
                                              _date.text = DateFormat('yyyy-mm-dd') .format(pickeddate);
                                            });
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            // ignore: prefer_const_constructors
                                            contentPadding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                                left: 5,
                                                right: 0),
                                            fillColor: const Color.fromARGB(
                                                255, 186, 231, 235),
                                            filled: true,
                                            suffixIcon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                            hintText: 'Time',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2.w),
                                                borderRadius:
                                                    BorderRadius.circular(80))),
                                        onTap: () async {
                                          DateTime? pickedtime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((value) {
                                            setState(() {
                                              _timeOfDay = value!;
                                            });
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Type of health checkup ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                                    ),
                                    Expanded(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 0,
                                              bottom: 0,
                                              left: 5,
                                              right: 0),
                                          fillColor: const Color.fromARGB(
                                              255, 186, 231, 235),
                                          filled: true,
                                          suffixIcon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          hintText: 'Type of health checkup',
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 2.w),
                                              borderRadius:
                                                  BorderRadius.circular(100))),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: const Color.fromARGB(
                                            255, 137, 184, 189),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(10),
                                                        color: Colors.white,
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      height: 350,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child: Image.asset(
                                                              'assets/main_assets/Completed.png',
                                                              width: 200,
                                                              height: 200,
                                                            ),
                                                          ),
                                                          // ignore: prefer_const_constructors
                                                          SizedBox(height: 10),

                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            'Thank You !!',
                                                            style: const TextStyle(
                                                                fontSize: 25,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        137,
                                                                        184,
                                                                        189),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          // ignore: prefer_const_constructors
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            'Thank You for free health checkup',
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        10,
                                                                        11),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        "submit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ))));
  }
}
