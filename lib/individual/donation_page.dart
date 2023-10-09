// ignore_for_file: use_build_context_synchronously

import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';
import 'package:intl/intl.dart';

class DonationPage extends StatefulWidget {
  static const String routeName = '/DonationPage';
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class _DonationPageState extends State<DonationPage> {
  bool isChecked = false;
  bool isLoading = false;
  String? amount, userId;
  // String? orgName;
  // String? orgAdd;
  final orgName = TextEditingController();
  final orgAdd = TextEditingController();

  final now = new DateTime.now();
  String date = new DateFormat.yMMMMd('en_US').toString();
  String time = new DateFormat.Hm().toString();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    orgName.dispose();
    orgAdd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> organizationAddress = [
      'India',
      'United States',
      'America',
      'Washington',
      'Paris',
      'Jakarta',
      'Australia',
      'Lorem Ipsum'
    ];

    List<SearchFieldListItem> newAddSuggestions = organizationAddress
        .map((orgAdd) => SearchFieldListItem(orgAdd, item: orgName))
        .toList();

    List<String> organizationSuggestions = [
      'Organisation 1',
      'Organisation 2',
      'Organisation 3',
      'Organisation 4',
      'Organisation 5',
      'Organisation 6',
    ];

    List<SearchFieldListItem> newSuggestions = organizationSuggestions
        .map((orgName) => SearchFieldListItem(orgName, item: orgName))
        .toList();
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[
            const BiDirectionalBackground(),
            Column(
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
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
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
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                ),
                SizedBox(
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
                          color: const Color.fromARGB(255, 176, 229, 233),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    height: 360.sp,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(35.w, 10.h, 10.w, 10.h),
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
                                      color: const Color.fromARGB(
                                          255, 120, 194, 204),
                                      width: 3.w),
                                ),
                                hintText: 'Amount',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  amount = value.trim();
                                });
                              },
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
                              hint: " Enter organisation's name",
                              suggestions: newSuggestions,
                              searchInputDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.w),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 137, 184, 189),
                                      width: 2.w),
                                ),
                                fillColor:
                                    const Color.fromARGB(255, 186, 231, 235),
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              controller: orgName,
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
                              hint: "Enter Organisation's Address",
                              suggestions: newAddSuggestions,
                              searchInputDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.w),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 137, 184, 189),
                                      width: 2.w),
                                ),
                                fillColor:
                                    const Color.fromARGB(255, 186, 231, 235),
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              controller: orgAdd,
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
                SizedBox(
                  height: 45.w,
                  width: 200.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 137, 184, 189),
                    ),
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        isLoading = true;
                      });

                      if (amount == "" ||
                          orgName.text.isEmpty ||
                          orgAdd.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter all fields")));
                      }

                      if (isChecked) {
                        userId = "Anonymous";
                      } else {
                        userId = FirebaseAuth.instance.currentUser!.uid;
                      }
                      await FirebaseFirestore.instance
                          .collection("Donation")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("Individual")
                          .add({
                        "userUid": userId,
                        "donationAmount": amount,
                        "Organisation name": orgName,
                        "Organisation Address": orgAdd,
                        "date": date,
                        "time": time,
                        "Receipt url": "No receipt Available",
                        "status": "Completed"
                      });

                      setState(() {
                        isLoading = false;
                      });

                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: 350,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                              color: Color.fromARGB(
                                                  255, 137, 184, 189),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          'Thank You for Donation',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 0, 10, 11),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          });
                    },
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
          ]),
        ),
      ),
    );
  }
}
