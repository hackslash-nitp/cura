import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/widgets/gradient_background.dart';

class IndividualAccountSetup extends StatefulWidget {
  const IndividualAccountSetup({Key? key}) : super(key: key);

  @override
  State<IndividualAccountSetup> createState() => _IndividualAccountSetupState();
}

class _IndividualAccountSetupState extends State<IndividualAccountSetup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final buttonStyle = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(100, 117, 212, 227),
  );

  final List<String> gender = ['Male', 'Female', 'Other'];
  String? userGender, dob;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    occupationController.dispose();
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
                          onPressed: () {},
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
                      Image(
                        image: const AssetImage(
                            'assets/startup_assets/create_account_assets/profile_primary.png'),
                        height: 110.h,
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                  SizedBox(
                    height: 450.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      child: ListView(
                        children: <Widget>[
                          getInputTextField(nameController, "Enter your Name",
                              TextInputType.name),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(emailController, "Enter your Email",
                              TextInputType.emailAddress),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(phoneController,
                              "Enter your Phone Number", TextInputType.number),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(occupationController,
                              "Enter your Occupation", TextInputType.name),
                          SizedBox(
                            height: 34.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 170.w,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(117, 212, 227, 0.2),
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
                              GestureDetector(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2012, 1),
                                      firstDate: DateTime(1940, 1),
                                      lastDate: DateTime(2012, 1));
                                  if (picked != null) {
                                    setState(() {
                                      dob =
                                          "${picked.day}/${picked.month}/${picked.year}";
                                    });
                                  }
                                },
                                child: Container(
                                  height: 60.h,
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
                                        dob ?? "DD/MM/YYYY",
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
                          getInputTextField(countryController,
                              "Enter your Country", TextInputType.name),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(cityController, "Enter your City",
                              TextInputType.name),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(
                              educationController,
                              "Enter your Educational Qualification",
                              TextInputType.name),
                          SizedBox(
                            height: 34.h,
                          ),
                          getInputTextField(bioController, "Write your Bio...",
                              TextInputType.name),
                        ],
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
                        onPressed: () {},
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

  Container getInputTextField(TextEditingController controller, String hintText,
      TextInputType inputType) {
    return Container(
      width: 365.w,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(117, 212, 227, 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
      child: TextField(
        controller: controller,
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
