import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> msgList = [
    {
      'msg': 'Hey!',
      'time': '4:00 pm',
      'isMe': true,
    },
    {
      'msg': 'Hello sir! How can we help you ?',
      'time': '4:01 pm',
      'isMe': false,
    },
    {
      'msg':
          'I want to come to your foundation. What’s the time allowed for outsiders to come?',
      'time': '4:02 pm',
      'isMe': true,
    },
    {
      'msg': 'Sir, you can come anytime between 09:00 a.m. to 05:00 p.m.',
      'time': '4:03 pm',
      'isMe': false,
    },
    {
      'msg': 'Okay! Thank you.',
      'time': '4:04 pm',
      'isMe': true,
    },
  ];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardActive = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => Stack(
          children: [
            const UniDirectionalBackground(),
            SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          )),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: msgList.length,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? DateMsgTile()
                              : MessageWidget(
                                  isMe: msgList[index]['isMe'],
                                  msg: msgList[index]['msg'],
                                  time: msgList[index]['time'],
                                );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      height: 80.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF92B7C0),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Transform.rotate(
                            angle: 45.0 * 3.14159 / 180,
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 28.h,
                                icon: const Icon(Icons.attach_file)),
                          ),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: null,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message....",
                                hintStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              iconSize: 28.h,
                              icon: const Icon(Icons.add_photo_alternate)),
                          IconButton(
                              onPressed: () {},
                              iconSize: 28.h,
                              icon: const Icon(Icons.mic)),
                          IconButton(
                              onPressed: () {},
                              iconSize: 28.h,
                              icon: const Icon(Icons.send)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (isKeyboardActive)
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 22.h,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30.w,
                      child: const Image(
                          image: AssetImage(
                              'assets/startup_assets/create_account_assets/profile_primary.png')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Organisation Name",
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateMsgTile extends StatelessWidget {
  const DateMsgTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 118.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(130, 113, 228, 0.5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                "26 June 2022",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final String msg, time;

  final Color myMsgColor = const Color(0xFFE0EEEF);
  final Color senderMsgColor = const Color(0xFFD9D9D9);

  const MessageWidget({
    Key? key,
    required this.isMe,
    required this.msg,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dpUrl = isMe
        ? "assets/startup_assets/create_account_assets/profile_primary.png"
        : "assets/main_assets/Completed.png";
    const BorderRadius myBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );
    const BorderRadius senderBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );

    final List<Widget> rowItems = <Widget>[
      CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 25.w,
        child: Image(image: AssetImage(dpUrl)),
      ),
      SizedBox(
        width: 10.w,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: isMe ? myMsgColor : senderMsgColor,
          borderRadius: isMe ? myBorderRadius : senderBorderRadius,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Text(
        time,
        style: TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: isMe ? rowItems.reversed.toList() : rowItems,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
