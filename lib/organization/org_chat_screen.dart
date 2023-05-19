import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrgChatScreen(userName: 'John Doe', imgUrl: ''),
    );
  }
}

class OrgChatScreen extends StatefulWidget {
  static const String routeName = '/OrgChatScreen';
  final String userName, imgUrl;
  const OrgChatScreen({Key? key, required this.userName, required this.imgUrl}) : super(key: key);

  @override
  State<OrgChatScreen> createState() => _OrgChatScreenState();
}

class _OrgChatScreenState extends State<OrgChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final CollectionReference messagesCollection = FirebaseFirestore.instance.collection('messages');

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
                        ),
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: messagesCollection.orderBy('time').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: documents.length,
                            itemBuilder: (context, index) {
                              final document = documents[index];
                              String currentDate = document['date'];
                              bool showDate = false;
                              if (index == 0) {
                                return DateMsgTile(convDate: document['date']);
                              } else if (index != documents.length - 1 && currentDate != documents[index + 1]['date']) {
                                showDate = true;
                                return MessageWidget(
                                  isMe: document['isMe'],
                                  msg: document['msg'],
                                  time: document['time'],
                                  showDate: showDate,
                                  nextDate: documents[index + 1]['date'],
                                  orgImgUrl: widget.imgUrl,
                                );
                              }
                              return MessageWidget(
                                isMe: document['isMe'],
                                msg: document['msg'],
                                time: document['time'],
                                showDate: showDate,
                                orgImgUrl: widget.imgUrl,
                              );
                            },
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
                            onPressed: () => sendMessage(messageController.text),
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
                            ? const AssetImage('assets/startup_assets/create_account_assets/profile_primary.png')
                            : AssetImage(widget.imgUrl),
                      ),
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

  Future<void> sendMessage(String message) async {
    if (message.isNotEmpty) {
      final time = DateTime.now();
      int hour = time.hour;
      String meridian = hour < 11 ? "am" : "pm";
      hour = hour % 11;
      hour = hour == 0 ? 12 : hour - 1;
      String timeInHours = hour < 10 ? "0$hour" : hour.toString();
      int minutes = time.minute;
      String minute = minutes < 10 ? "0$minutes" : minutes.toString();
      String month = months[time.month - 1];

      await messagesCollection.add({
        'msg': message.trim(),
        'isMe': true,
        'time': "$timeInHours:$minute $meridian",
        'date': "${time.day} $month ${time.year}"
      });

      messageController.clear();
    }
  }
}

class UniDirectionalBackground extends StatelessWidget {
  const UniDirectionalBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8E9EAB),
            Color(0xFFeef2f3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final String msg, time;
  final bool showDate;
  final String nextDate;
  final String orgImgUrl;

  const MessageWidget({
    Key? key,
    required this.isMe,
    required this.msg,
    required this.time,
    required this.showDate,
    required this.nextDate,
    required this.orgImgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        if (showDate)
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: DateMsgTile(convDate: nextDate),
          ),
        Row(
          mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            if (!isMe)
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 22.w,
                child: Image(
                  image: orgImgUrl == ""
                      ? AssetImage('assets/startup_assets/create_account_assets/profile_primary.png')
                      : AssetImage(orgImgUrl),
                ),
              ),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.65,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class DateMsgTile extends StatelessWidget {
  final String convDate;

  const DateMsgTile({Key? key, required this.convDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            convDate,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
