import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/ChatScreen';
  final String orgName, imgUrl;
  const ChatScreen({Key? key, required this.orgName, required this.imgUrl})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
  List<Map<String, dynamic>> msgList = [];

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('messages').get();
    msgList = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    setState(() {});
  }

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
<<<<<<< HEAD
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
=======
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h,),
>>>>>>> 219bfa7 (Made changes to he UI of the Chat Bubble and Background Color of User Chat Screen)
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
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
                          } else if (index != msgList.length - 1 &&
                              currentDate != msgList[index + 1]['date']) {
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
                      height: 70.h,
                      width: 420.w,
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
                              icon: const Icon(Icons.attach_file),
                            ),
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
                            icon: const Icon(Icons.add_photo_alternate),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 28.h,
                            icon: const Icon(Icons.mic),
                          ),
                          IconButton(
                            onPressed: () async {
                              final time = DateTime.now();
                              int hour = time.hour;
                              String meridian = hour < 11 ? "am" : "pm";
                              hour = hour % 11;
                              hour = hour == 0 ? 12 : hour - 1;
                              String timeInHours =
                                  hour < 10 ? "0$hour" : hour.toString();
                              int minutes = time.minute;
                              String minute = minutes < 10
                                  ? "0$minutes"
                                  : minutes.toString();
                              String month = months[time.month - 1];
                              await FirebaseFirestore.instance
                                  .collection('messages')
                                  .add({
                                'msg': messageController.text.trim(),
                                'isMe': true,
                                'time': "$timeInHours:$minute $meridian",
                                'date': "${time.day} $month ${time.year}"
                              });
                              messageController.clear();
                              loadMessages();
                              FocusScope.of(context).unfocus();
                            },
                            iconSize: 28.h,
                            icon: const Icon(Icons.send),
                          ),
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
                            ? const AssetImage(
                                'assets/startup_assets/create_account_assets/profile_primary.png')
                            : AssetImage(widget.imgUrl),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      widget.orgName,
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
        children: <Widget>[
          SizedBox(height: 20.h),
          Text(
            convDate,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final String msg;
  final String time;
  final bool showDate;
  final String? nextDate;
  final String orgImgUrl;

  const MessageWidget({
    Key? key,
    required this.isMe,
    required this.msg,
    required this.time,
    required this.showDate,
    this.nextDate,
    required this.orgImgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        if (showDate)
          DateMsgTile(
            convDate: nextDate!,
          ),
        Container(
          // width: 260.w,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFFC2E8DC) : const Color(0xFFE8E8E8),
            borderRadius: isMe ? const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            )
            : const BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                msg,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

<<<<<<< HEAD
=======
class UniDirectionalBackground extends StatelessWidget {
  const UniDirectionalBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(
      gradientColor: LinearGradient(
        colors: [
          Color(0xFF92B7C0),
          Color(0xFFA8CEBF),
          Color(0xFFCCE7BA),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}

>>>>>>> 219bfa7 (Made changes to he UI of the Chat Bubble and Background Color of User Chat Screen)
class GradientBackground extends StatelessWidget {
  final Gradient gradientColor;

  const GradientBackground({Key? key, required this.gradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradientColor,
      ),
    );
  }
}
