import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgChatScreen extends StatefulWidget {
  static const String routeName = '/OrgChatScreen';
  final String userName, imgUrl;
  const OrgChatScreen({Key? key, required this.userName, required this.imgUrl}) : super(key: key);

  @override
  State<OrgChatScreen> createState() => _OrgChatScreenState();
}

class _OrgChatScreenState extends State<OrgChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  final List<Map<String, dynamic>> msgList = [
    {'msg': 'Hey!', 'time': '4:00 pm', 'isMe': true, 'date': '18 August 2022'},
    {'msg': 'Hello sir! How can we help you ?', 'time': '4:01 pm', 'isMe': true, 'date': '18 August 2022'},
    {
      'msg': 'I want to come to your foundation. What’s the time allowed for outsiders to come?',
      'time': '4:02 pm',
      'isMe': false,
      'date': '18 August 2022'
    },
    {
      'msg': 'Sir, you can come anytime between 09:00 a.m. to 05:00 p.m.',
      'time': '4:03 pm',
      'isMe': true,
      'date': '19 August 2022'
    },
    {'msg': 'Okay! Thank you.', 'time': '4:04 pm', 'isMe': false, 'date': '20 August 2022'},
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
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
                          String currentDate = msgList[index]['date'];
                          bool showDate = false;
                          if (index == 0) {
                            return DateMsgTile(
                              convDate: msgList[0]['date'],
                            );
                          } else if (index != msgList.length - 1 && currentDate != msgList[index + 1]['date']) {
                            showDate = true;
                            return MessageWidget(
                              isMe: msgList[index]['isMe'],
                              msg: msgList[index]['msg'],
                              time: msgList[index]['time'],
                              showDate: showDate,
                              nextDate: msgList[index + 1]['date'],
                              orgImgUrl: widget.imgUrl,
                            );
                          }
                          return MessageWidget(
                            isMe: msgList[index]['isMe'],
                            msg: msgList[index]['msg'],
                            time: msgList[index]['time'],
                            showDate: showDate,
                            orgImgUrl: widget.imgUrl,
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
                            child: IconButton(onPressed: () {}, iconSize: 28.h, icon: const Icon(Icons.attach_file)),
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
                          IconButton(onPressed: () {}, iconSize: 28.h, icon: const Icon(Icons.add_photo_alternate)),
                          IconButton(onPressed: () {}, iconSize: 28.h, icon: const Icon(Icons.mic)),
                          IconButton(
                              onPressed: () {
                                //The following code is for formatting purposes to display date.
                                //--------------------------------------------------------------------
                                final time = DateTime.now();
                                int hour = time.hour;
                                String meridian = hour < 11 ? "am" : "pm";
                                hour = hour % 11;
                                hour = hour == 0 ? 12 : hour - 1;
                                String timeInHours = hour < 10 ? "0$hour" : hour.toString();
                                //--------------------------------------------------------------------
                                int minutes = time.minute;
                                String minute = minutes < 10 ? "0$minutes" : minutes.toString();
                                //--------------------------------------------------------------------
                                String month = months[time.month - 1];
                                setState(() {
                                  msgList.add({
                                    'msg': messageController.text.trim(),
                                    'isMe': true,
                                    'time': "$timeInHours:$minute $meridian",
                                    'date': "${time.day} $month ${time.year}"
                                  });
                                });
                                messageController.clear();
                                FocusScope.of(context).unfocus();
                              },
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
                      child: Image(
                          image: widget.imgUrl == ""
                              ? const AssetImage('assets/startup_assets/create_account_assets/profile_primary.png')
                              : AssetImage(widget.imgUrl)),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      widget.userName,
                      style: TextStyle(
                        fontSize: 22.sp,
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
  final String convDate;

  const DateMsgTile({
    Key? key,
    required this.convDate,
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
                convDate,
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
  final bool isMe, showDate;
  final String msg, time, orgImgUrl;
  final String? nextDate;

  final Color myMsgColor = const Color(0xFFE0EEEF);
  final Color senderMsgColor = const Color(0xFFD9D9D9);

  const MessageWidget(
      {Key? key,
      required this.isMe,
      required this.msg,
      required this.time,
      required this.showDate,
      this.nextDate,
      required this.orgImgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dpUrl = isMe ? "assets/startup_assets/create_account_assets/profile_primary.png" : orgImgUrl;
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
          mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: isMe ? rowItems.reversed.toList() : rowItems,
        ),
        const SizedBox(
          height: 20,
        ),
        if (showDate) DateMsgTile(convDate: nextDate!),
      ],
    );
  }
}
