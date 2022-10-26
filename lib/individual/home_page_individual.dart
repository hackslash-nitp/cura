import 'package:cura/individual/adopt.dart';
import 'package:cura/individual/donation_page.dart';
import 'package:cura/individual/health.dart';
import 'package:cura/individual/spend_time.dart';
import 'package:cura/organization/postfeed.dart';
import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../shared/services/firebase_authentication.dart';

//This is a temporary Home Screen, to be used for testing purposes
class HomePageIndividual extends StatefulWidget {
  static const String routeName = '/HomePageIndividual';
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
    "assets/Group discussion-bro 1.png",
    "assets/Social share-bro 1.png"
  ];

  List<String> headings = ["Adopt", "Health", "Donate", "Spend Time", "Posts Feed"];

  List<String> subHeadings = [
    "Adopt an old person or a child",
    "Give them free treat",
    "Donate for their needs",
    "Spend time with children and old person",
    "Know more about old person and children"
  ];

  @override
  Widget build(BuildContext context) {
    List navRoutes = [
      AdoptPage.routeName,
      HealthPage.routeName,
      DonationPage.routeName,
      SpendTime.routeName,
      postfeed.routeName,
    ];

    TextEditingController searchController = TextEditingController();
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
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
                    image: const AssetImage("assets/Mobile life-amico 2.png"),
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
                          boxShadow: const [BoxShadow(blurRadius: 5.0, offset: Offset(0, 3), color: Colors.grey)]),
                      child: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                          itemBuilder: ((context, index) {
                            return HomePageContent(
                              imgUrl: imgUrls[index],
                              heading: headings[index],
                              subHeading: subHeadings[index],
                              index: index,
                              widget: navRoutes[index],
                              isOdd: index % 2 == 0,
                            );
                          }),
                          separatorBuilder: ((context, index) => SizedBox(height: 23.h))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final String imgUrl, heading, subHeading;
  final int index;
  final bool isOdd;
  final String widget;

  const HomePageContent(
      {Key? key,
      required this.imgUrl,
      required this.heading,
      required this.subHeading,
      required this.index,
      required this.widget,
      required this.isOdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(widget),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
              boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey, offset: Offset(0, 3))]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: isOdd ? 3 : 4,
                  child: isOdd
                      ? TextPart(heading: heading, subHeading: subHeading)
                      : ImagePart(imgUrl: imgUrl, index: index),
                ),
                const Spacer(),
                Expanded(
                  flex: isOdd ? 4 : 3,
                  child: isOdd
                      ? ImagePart(imgUrl: imgUrl, index: index)
                      : TextPart(heading: heading, subHeading: subHeading),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePart extends StatelessWidget {
  const ImagePart({
    Key? key,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  final String imgUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFC7E2E4),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: const [BoxShadow(color: Color(0x55000000), offset: Offset(0, 2), blurRadius: 2.0)]),
      child: Center(
        child: Image(
          image: AssetImage(imgUrl),
          height: index != 3 ? 150.h : 120.h,
        ),
      ),
    );
  }
}

class TextPart extends StatelessWidget {
  const TextPart({
    Key? key,
    required this.heading,
    required this.subHeading,
  }) : super(key: key);

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700, color: const Color(0xFF92B7C0)),
        ),
        Text(
          subHeading,
          style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(0, 0, 0, 0.58), fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
