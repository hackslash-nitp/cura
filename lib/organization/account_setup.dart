import 'dart:io';
import 'package:cura/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../shared/widgets/gradient_background.dart';

class OrgAccountSetup extends StatefulWidget {
  const OrgAccountSetup({Key? key}) : super(key: key);

  @override
  State<OrgAccountSetup> createState() => _OrgAccountSetupState();
}

class _OrgAccountSetupState extends State<OrgAccountSetup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final buttonStyle = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(100, 117, 212, 227),
  );

  final List<String> gender = ['Male', 'Female', 'Other'];
  String? userGender, estdDate;
  File? userImage, userAttachment;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    regNumberController.dispose();
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                            ? const AssetImage(
                                'assets/startup_assets/create_account_assets/profile_primary.png')
                            : FileImage(userImage!) as ImageProvider,
                        radius: 50.r,
                        backgroundColor: Colors.transparent,
                      ),
                      Column(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            style: buttonStyle,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 4.h),
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
                                    final image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (image == null) return;
                                    setState(() {
                                      userImage = File(image.path);
                                    });
                                  } catch (e) {
                                    print("An error has occured!");
                                  }
                                },
                                style: buttonStyle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 4.h),
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
                                    final image = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                    if (image == null) return;
                                    setState(() {
                                      userImage = File(image.path);
                                    });
                                  } catch (e) {
                                    print(
                                        "An error has occured! ${e.toString()}");
                                  }
                                },
                                style: buttonStyle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 4.h),
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
                      "Enter Organisation Details:",
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
                    key: _formKey,
                    child: SizedBox(
                      height: 470.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 20.h),
                        child: ListView(
                          children: <Widget>[
                            getInputTextField(
                                false,
                                70.h,
                                365.w,
                                nameController,
                                "Enter Organisation Name",
                                TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter organisation name";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                false,
                                70.h,
                                365.w,
                                emailController,
                                "Enter Organisation Email",
                                TextInputType.emailAddress, (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  !val.contains('@')) {
                                return "Please enter a proper email address";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                false,
                                70.h,
                                365.w,
                                phoneController,
                                "Enter Organisation Contact Number",
                                TextInputType.number, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter organisation contact number";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                false,
                                70.h,
                                365.w,
                                regNumberController,
                                "Enter Organisation Registration Number",
                                TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter registration number";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            Text(
                              "Organisation Type:",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    hint: Text("Select",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
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
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                false,
                                70.h,
                                365.w,
                                countryController,
                                "Enter your Country",
                                TextInputType.name, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your country";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            getInputTextField(
                                true,
                                120.h,
                                365.w,
                                addressController,
                                "Enter your Address",
                                TextInputType.multiline, (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter organisation address";
                              }
                            }),
                            SizedBox(
                              height: 34.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                getInputTextField(
                                    false,
                                    70.h,
                                    170.w,
                                    pincodeController,
                                    "Pincode",
                                    TextInputType.number, (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Please enter pincode";
                                  }
                                }),
                                GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime(2012, 1),
                                            firstDate: DateTime(1940, 1),
                                            lastDate: DateTime(2012, 1));
                                    if (picked != null) {
                                      setState(() {
                                        estdDate =
                                            "${picked.day}/${picked.month}/${picked.year}";
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 70.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          117, 212, 227, 0.2),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          estdDate ?? "Estd. Date",
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
                            Container(
                              width: 365.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(117, 212, 227, 0.2),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 7.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 270.w,
                                      child: Text(
                                        userAttachment == null
                                            ? "Upload Organisation Authenticity Certificate Issued by Government"
                                            : userAttachment!.path.toString(),
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 104, 104, 104),
                                        ),
                                      ),
                                    ),
                                    Transform.rotate(
                                      angle: 45.0 * 3.14159 / 180,
                                      child: IconButton(
                                          onPressed: () async {
                                            try {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles();
                                              if (result == null) {
                                                return;
                                              } else if (result
                                                          .files.first.size /
                                                      1000000 >
                                                  3) {
                                                CustomSnackbar.showSnackBar(
                                                    context,
                                                    "File size larger than 3 MB",
                                                    Colors.red);
                                                return;
                                              }
                                              File? file = File(
                                                  result.files.first.path!);
                                              print(result.files.first.size
                                                  .toString());
                                              setState(() {
                                                userAttachment = file;
                                              });
                                            } catch (e) {
                                              print(
                                                  "An exception occured: ${e.toString()}");
                                            }
                                          },
                                          icon: const Icon(
                                              Icons.attach_file_outlined)),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Center(
                              child: Text(
                                "* File must be in PDF format of <= 3mb",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      width: 305.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              estdDate != null &&
                              userGender != null &&
                              userAttachment != null) {
                            CustomSnackbar.showSnackBar(
                                context, "Processing Data", Colors.lightGreen);
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
      bool isExtended,
      double? height,
      double? width,
      TextEditingController controller,
      String hintText,
      TextInputType inputType,
      String? Function(String?) validator) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(117, 212, 227, 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
      child: TextFormField(
        minLines: isExtended ? null : 1,
        maxLines: isExtended ? null : 1,
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        expands: isExtended,
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