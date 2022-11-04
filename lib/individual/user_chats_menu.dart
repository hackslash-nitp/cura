import 'package:cura/individual/user_chat_screen.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:cura/individual/home_page_individual.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/widgets/gradient_background.dart';
import 'package:cura/shared/services/stringScreenArguments.dart';

class UserChatsScreen extends StatefulWidget {
  static const String routeName = '/UserChatScreen';
  const UserChatsScreen({Key? key}) : super(key: key);

  @override
  State<UserChatsScreen> createState() => _UserChatsScreenState();
}

class _UserChatsScreenState extends State<UserChatsScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> contactInfo = [
    {'imgUrl': 'assets/preview1.png', 'title': 'Alpha Male Old Age Home'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Barrel Orphanage'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Cars & Love Orphanage'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Cinderella Girl Orphanage'},
    {'imgUrl': 'assets/preview1.png', 'title': 'El Nino Pola Orphanage'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Sigma Male Old Age Home'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Trust Orphanage'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Younity Foundation'},
    {'imgUrl': 'assets/preview1.png', 'title': 'Yeet Child Foundation'},
  ];
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 14,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(HomePageIndividual.routeName);
          },
        ),
        elevation: 0.0,
        title: const Text(
          "My Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Stack(
          children: <Widget>[
            const UniDirectionalBackground(),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
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
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: contactInfo.length,
                        itemBuilder: (context, index) => ContactTile(
                          orgName: contactInfo[index]['title']!,
                          imgUrl: contactInfo[index]['imgUrl']!,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTile extends StatefulWidget {
  final String imgUrl, orgName;

  const ContactTile({
    Key? key,
    required this.imgUrl,
    required this.orgName,
  }) : super(key: key);

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  Color secondaryColor = const Color(0xFFE0EEEF);

  Color primaryColor = const Color(0xFF92B7C0);

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) {
        setState(() {
          isFocused = true;
        });
      },
      onLongPressEnd: (_) {
        setState(() {
          isFocused = false;
        });
      },
      onTap: () {
        Navigator.of(context).pushNamed(ChatScreen.routeName,
            arguments: StringScreenArguments(nameProvided: widget.orgName, imgUrl: widget.imgUrl));
      },
      child: Container(
        height: 65.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isFocused ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 5.w,
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: widget.imgUrl == ''
                        ? const AssetImage("assets/startup_assets/create_account_assets/profile_primary.png")
                        : AssetImage(widget.imgUrl),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  widget.orgName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 12.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
