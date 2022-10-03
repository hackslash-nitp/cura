import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../shared/services/firebase_authentication.dart';

//This is a temporary Home Screen, to be used for testing purposes
class HomePageIndividual extends StatefulWidget {
  const HomePageIndividual({Key? key}) : super(key: key);

  @override
  State<HomePageIndividual> createState() => _HomePageIndividualState();
}

class _HomePageIndividualState extends State<HomePageIndividual> {
  FirebaseAuthentication auth = FirebaseAuthentication();

  List<String> imgUrls = [
    "assets/Parents-cuate 1.png",
    "assets/Nursing home-rafiki 1.png",
    "assets/Humanitarian Help-bro 1.png",
    "assets/screen_time_one.jpeg",
    "assets/Social share-bro 1.png"
  ];

  List<String> headings = [
    "Adopt",
    "Health",
    "Donate",
    "Spend Time",
    "Posts Feed"
  ];

  List<String> subHeadings = [
    "Adopt an old person or a child",
    "Give them free treat",
    "Donate for their needs",
    "Spend time with children and old person",
    "Know more about old person and children"
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(238, 926),
        builder: (context, child) => Scaffold(
            extendBodyBehindAppBar: true,
            body: Stack(
              children: <Widget>[
                const UniDirectionalBackground(),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image:
                            const AssetImage("assets/Mobile life-amico 2.png"),
                        height: 300.h,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                    color: Colors.grey)
                              ]),
                          child: TextField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: imgUrls.length,
                              itemBuilder: ((context, index) => HomePageContent(
                                    imgUrl: imgUrls[index],
                                    heading: headings[index],
                                    subHeading: subHeadings[index],
                                    index: index,
                                  )),
                              separatorBuilder: ((context, index) =>
                                  SizedBox(height: 23.h))))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final String imgUrl, heading, subHeading;
  final int index;
  const HomePageContent(
      {Key? key,
      required this.imgUrl,
      required this.heading,
      required this.subHeading,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: const [
              BoxShadow(blurRadius: 5, color: Colors.grey, offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      heading,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF92B7C0)),
                    ),
                    Text(
                      subHeading,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Image(
                image: AssetImage(imgUrl),
                height: index != 3 ? 150.h : 120.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
