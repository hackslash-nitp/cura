import 'package:cura/individual/home_page_individual.dart';
import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdoptPage extends StatefulWidget {
  const AdoptPage({super.key});

  @override
  State<AdoptPage> createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  final List<String> imgUrls = [
    "assets/images 1.png",
    "assets/photo-1562457753-6867bda028cd 1.png"
  ];

  final List<String> headings = ["Shan Wan", "Hennrick"];

  final List<String> subHeadings = [
    "Detail of Person and age",
    "Detail of Person and age"
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => Scaffold(
        bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Adopt",
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            const UniDirectionalBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                  ),
                  const Image(
                    image: AssetImage("assets/Parents-cuate 1.png"),
                    width: double.infinity,
                  ),
                  Expanded(
                      child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: imgUrls.length,
                    itemBuilder: (context, index) => AdoptPageContent(
                      heading: headings[index],
                      subHeading: subHeadings[index],
                      imgUrl: imgUrls[index],
                      index: index,
                      widget: null,
                      isOdd: index % 2 == 0,
                    ),
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 20.h,
                        )),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdoptPageContent extends StatelessWidget {
  final String imgUrl, heading, subHeading;
  final int index;
  final bool isOdd;
  final Widget? widget;

  const AdoptPageContent(
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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => widget ?? const HomePageIndividual()))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5, color: Colors.grey, offset: Offset(0, 3))
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: isOdd ? 3 : 4,
                  child: isOdd
                      ? AdoptTextPart(heading: heading, subHeading: subHeading)
                      : AdoptImagePart(imgUrl: imgUrl, index: index),
                ),
                const Spacer(),
                Expanded(
                  flex: isOdd ? 4 : 3,
                  child: isOdd
                      ? AdoptImagePart(imgUrl: imgUrl, index: index)
                      : AdoptTextPart(heading: heading, subHeading: subHeading),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdoptImagePart extends StatelessWidget {
  final String imgUrl;
  final int index;

  const AdoptImagePart({
    Key? key,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imgUrl),
      height: 180.h,
    );
  }
}

class AdoptTextPart extends StatelessWidget {
  const AdoptTextPart({
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF92B7C0)),
        ),
        Text(
          subHeading,
          style: TextStyle(
              fontSize: 18.sp,
              color: const Color.fromRGBO(0, 0, 0, 0.58),
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
