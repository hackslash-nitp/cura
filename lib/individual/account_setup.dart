import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/shared/model/individual.dart';
import 'package:cura/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../shared/widgets/gradient_background.dart';
import '../shared/services/firebase_database.dart';

class IndividualAccountSetup extends StatefulWidget {
  static const String routeName = '/IndividualAccountSetup';
  const IndividualAccountSetup({Key? key}) : super(key: key);

  @override
  State<IndividualAccountSetup> createState() => _IndividualAccountSetupState();
}

class _IndividualAccountSetupState extends State<IndividualAccountSetup> {
  late List<TextEditingController> controllerList;

  final _indFormKey = GlobalKey<FormState>();

  final buttonStyle = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(100, 117, 212, 227),
  );

  final FirestoreDatabase db = FirestoreDatabase();
  final Storage storage = Storage();
  final List<String> gender = ['Male', 'Female', 'Other'];
  String? userGender, dob, imgUrl, imgName = "random212";
  File? userImage;
  bool isSelected = false;

  @override
  void initState() {
    controllerList = List.generate(8, (index) => TextEditingController(), growable: false);
    super.initState();
  }

  @override
  void dispose() {
    for (var element in controllerList) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            const UniDirectionalBackground(),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 14.h,
                        ),
                        Text(
                          "Profile Setup",
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: userImage == null
                            ? const AssetImage('assets/startup_assets/create_account_assets/profile_primary.png')
                            : FileImage(userImage!) as ImageProvider,
                        radius: 50.r,
                        backgroundColor: Colors.transparent,
                      ),
                      Column(
                        children: <Widget>[
                          TextButton(
                            onPressed: () async {
                              if (!isSelected) {
                                CustomSnackbar.showSnackBar(context, "Select an image first", Colors.red);
                                return;
                              }
                              imgUrl = await storage.postFile(userImage!, "DisplayPictures/${imgName!}");
                            },
                            style: buttonStyle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                              child: Text(
                                "Upload Profile Picture",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  try {
                                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                    if (image == null) return;
                                    setState(() {
                                      userImage = File(image.path);
                                      imgName = image.name;
                                      isSelected = true;
                                    });
                                  } catch (e) {
                                    print("An error has occured!");
                                  }
                                },
                                style: buttonStyle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  child: Text(
                                    "From Gallery",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.w),
                              TextButton(
                                onPressed: () async {
                                  try {
                                    final image = await ImagePicker().pickImage(source: ImageSource.camera);
                                    if (image == null) return;
                                    setState(() {
                                      userImage = File(image.path);
                                      isSelected = true;
                                      imgName = image.name;
                                    });
                                  } catch (e) {
                                    print("An error has occured! ${e.toString()}");
                                  }
                                },
                                style: buttonStyle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  child: Text(
                                    "Take Now",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Text(
                      "Enter Your Details:",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color.fromRGBO(0, 0, 0, 0.33),
                  ),
                  Form(
                    key: _indFormKey,
                    child: SizedBox(
                      height: 450.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                        child: ListView(
                          children: <Widget>[
                            getInputTextField(controllerList[0], "Enter your Name", TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[1], "Enter your Email", TextInputType.emailAddress, (val) {
                              if (val == null || val.isEmpty || !val.contains('@')) {
                                return "Please enter a proper email address";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[2], "Enter your Phone Number", TextInputType.number,
                                (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your contact number";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[3], "Enter your Occupation", TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your occupation";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 170.w,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(117, 212, 227, 0.2),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: userGender,
                                        style: TextStyle(
                                            fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black),
                                        hint: Text("Gender",
                                            style: TextStyle(
                                                fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black)),
                                        items: gender.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            userGender = value!.toString();
                                          });
                                        }),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2012, 1),
                                        firstDate: DateTime(1940, 1),
                                        lastDate: DateTime(2012, 1));
                                    if (picked != null) {
                                      setState(() {
                                        dob = "${picked.day}/${picked.month}/${picked.year}";
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(117, 212, 227, 0.2),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          dob ?? "Date of Birth",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[4], "Enter your Country", TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your country";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[5], "Enter your City", TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your city";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                controllerList[6], "Enter your Educational Qualification", TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(controllerList[7], "Write your Bio...", TextInputType.name, (val) {
                              return null;
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      width: 305.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_indFormKey.currentState!.validate() && dob != null && userGender != null) {
                            IndividualUser individual = IndividualUser(
                                individualName: controllerList[0].text.trim(),
                                individualEmail: controllerList[1].text.trim(),
                                individualContact: controllerList[2].text.trim(),
                                occupation: controllerList[3].text.trim(),
                                country: controllerList[4].text.trim(),
                                city: controllerList[5].text.trim(),
                                gender: userGender!,
                                imgUrl: imgUrl == null ? "" : imgUrl!,
                                dob: dob!,
                                education: controllerList[6].text.trim(),
                                bio: controllerList[7].text.trim());
                            Map<String, dynamic> userJSON = individual.toJSON();
                            await db.postIndividualProfileData(userJSON).then(
                                (value) => Navigator.of(context).pushReplacementNamed(HomePageIndividual.routeName));
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF72B7C2),
                        ),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getInputTextField(
      TextEditingController controller, String hintText, TextInputType inputType, String? Function(String?) validator) {
    return Container(
      width: 365.w,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(117, 212, 227, 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        style: TextStyle(
          color: const Color.fromARGB(255, 104, 104, 104),
          fontWeight: FontWeight.w400,
          fontSize: 17.sp,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
