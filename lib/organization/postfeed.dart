import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cura/shared/screens/create_post.dart';
import 'package:cura/shared/services/firebase_database.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:cura/individual/home_page_individual.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_share/social_share.dart';

class postfeed extends StatefulWidget {
  static const String routeName = '/postfeed';

  const postfeed({Key? key}) : super(key: key);

  @override
  State<postfeed> createState() => _postfeedState();
}

class _postfeedState extends State<postfeed> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF6CAFB4),
            title: Text(
              "Posts Feed",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.w,
                  fontWeight: FontWeight.w500),
              softWrap: true,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 15.w,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(HomePageIndividual.routeName);
              },
            ),
            actions: [ IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              icon: const Icon(
                Icons.add_circle,
                size: 45.0,
                color: Colors.white70,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(CreatePost.routeName);
              },
            ),],
          ),
              bottomNavigationBar: const CustomNavigationBar(currentIndex: 1),
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
                  child: Column(
                      children: [
                        SizedBox(height:10.h),
                    StreamBuilder(
                        stream: FirestoreDatabase().getPostData(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          List<Map<String, dynamic>> posts =
                              List<Map<String, dynamic>>.from(
                                  snapshot.data.docs.map((DocumentSnapshot e) {
                            return e.data();
                          }).toList());
                          posts.sort((a,b)=>a['createdOn'].compareTo(b['createdOn']));
                          return Expanded(
                            child: ListView.builder(
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                return PostWidget(posts[index]);
                              },
                            ),
                          );
                        })
                  ]),
                ),
              )),
            ));
  }
}

class PostWidget extends StatelessWidget {
  Map<String, dynamic> postData;

  PostWidget(this.postData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                     image:CachedNetworkImageProvider(postData['userImgUrl'] != ''
                          ? postData['userImgUrl']
                          : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',),
                      height: 45.h,
                      width: 45.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      postData['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                    ),
                    Text(
                      postData['createdOn'],
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  ]),
                ],
              ),


              Icon(Icons.more_vert),
              //three dot
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            postData["imagesUrl"].isEmpty?const SizedBox():Image(width:372.w,height:372.w,fit:BoxFit.cover,image:CachedNetworkImageProvider(postData["imagesUrl"][0])),
            Container(
              height: 50.h,
              width: 372.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF6CAFB4),
                  )),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FavoriteButton(
                  iconSize: 60.r,
                  valueChanged: (_) {},
                ),
                SizedBox(
                  width: 80.w,
                ),
                Icon(Icons.comment),
                SizedBox(
                  width: 80.w,
                ),
                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      SocialShare.shareOptions("Hello world",
                          imagePath: 'imagepath');
                    }),
              ]),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              postData['postText'],
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ],
    );
  }
}
