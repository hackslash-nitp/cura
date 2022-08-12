import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool hasChanged = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin:Alignment.topCenter,
                        end:Alignment.bottomCenter,
                        colors: [
                          Color(0x71E0EEEF),
                          Colors.white38,
                        ],
                      ),
                    ),
                    child: Image.asset("assets/startup_assets/create_account_assets/create_account.png")),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      transform: GradientRotation(1.5707),
                      colors: [
                        Color(0x77E0EEEF),
                        Color(0x00E0EEEF),
                        Color(0x7792B7C0),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Select user type",
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Color(0xFF729CA3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "select user type you want to\n proceed with",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CarouselSlider(
                        items: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/startup_assets/create_account_assets/profile_primary.png",
                                  color: hasChanged
                                      ? Color(0xFFbbbbbb)
                                      : Color(0xFF92B7C0)),
                              Text("HELPER",
                                  style: TextStyle(
                                    color: hasChanged
                                        ? Color(0xFFbbbbbb)
                                        : Color(0xFF729CA3),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/startup_assets/create_account_assets/profile_primary.png",
                                  color: hasChanged
                                      ? Color(0xFF92B7C0)
                                      : Color(0xFFbbbbbb)),
                              Text(
                                "ORGANISATION",
                                style: TextStyle(
                                  color: hasChanged
                                      ? Color(0xFF729CA3)
                                      : Color(0xFFbbbbbb),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          )
                        ],
                        options: CarouselOptions(
                          height: 180.0,
                          viewportFraction: 0.50,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          onPageChanged: (indexOfPage, reason) {
                            //indexOfPage=0: Helper
                            //indexOfPage=1: Organisation
                            setState(() {
                              hasChanged = !hasChanged;
                            });
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //next button functionality
                        },
                        style: TextButton.styleFrom(
                          alignment: Alignment.topCenter,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          backgroundColor: Color(0xFF92B7C0),
                          minimumSize: Size(100.0, 40.0),
                        ),
                        child: Text("next",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: IconButton(
              onPressed: (){
                //BackButton functionality
              },
              icon:Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }
}
