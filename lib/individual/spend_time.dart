import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:cura/shared/services/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:cura/shared/widgets/message_dialog.dart';

class SpendTime extends StatefulWidget {
  const SpendTime({super.key});

  @override
  State<SpendTime> createState() => _SpendTimeState();
}

class _SpendTimeState extends State<SpendTime> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController orgName = TextEditingController();

  FirestoreDatabase fd = FirestoreDatabase();
  List<String> organisationNames = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List organisationProfiles = await fd.getOrganisationProfileData();
    for (var organisation in organisationProfiles) {
      organisationNames.add(organisation["orgName"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        const BiDirectionalBackground(),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.34,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.keyboard_arrow_left),
                          onPressed: () => Navigator.of(context).pop()),
                      const Center(
                          child: Text(
                        'Spend Time',
                        textAlign: TextAlign.center,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ))
                    ]),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.031,
              ),
              Container(
                // constraints: const BoxConstraints.expand(),
                // ignore: prefer_const_constructors

                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: Color(0xFFE2EFF0),
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.width * 0.063))),
                // ignore: prefer_const_constructors
                // padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.1,MediaQuery.of(context).size.height * 0.1,MediaQuery.of(context).size.height * 0.1,MediaQuery.of(context).size.height * 0.1),
                //MediaQuery.of(context).size.height * 0.44,MediaQuery.of(context).size.height * 0.44,),
                width: MediaQuery.of(context).size.width * 0.82,
                height: MediaQuery.of(context).size.height * 0.52,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.033,
                        width: MediaQuery.of(context).size.height * 0.22,
                        alignment: Alignment.topLeft,
                        /* padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.023,
                             MediaQuery.of(context).size.height * 0.025, MediaQuery.of(context).size.height * 0.138, MediaQuery.of(context).size.height * 0.38),*/
                        child: Text(
                          'Select Organization',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    // ignore: missing_required_param
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      /*MediaQuery.of(context).size.height * 0.022, MediaQuery.of(context).size.height * 0.09,MediaQuery.of(context).size.height * 0.03,
                   MediaQuery.of(context).size.height * 0.033),*/
                      // ignore: missing_required_param
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: SearchField(
                          hint: "Enter organisation's name",
                          //searchStyle: TextStyle(fontSize:MediaQuery.of(context).size.height*0.036 ),
                          // padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.height * 0.05,MediaQuery.of(context).size.height * 0.05),
                          // ignore: prefer_const_literals_to_create_immutables
                          suggestions: organisationNames,
                          controller: orgName,
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.02),
                              borderSide: BorderSide(
                                // ignore: prefer_const_constructors
                                color: Colors.grey,
                                //height: MediaQuery.of(context).size.height*0.038,
                                //width: MediaQuery.of(context).size.height*,
                              ),
                            ),
                            fillColor: const Color.fromARGB(255, 186, 231, 235),
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                              //size:MediaQuery.of(context).size.height*0.0093,
                            ),
                          ),

                          //hintText: 'Time',
                          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.0026),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height * 0.033,
                        width: MediaQuery.of(context).size.height * 0.22,
                        /* padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.023,
                             MediaQuery.of(context).size.height * 0.025, MediaQuery.of(context).size.height * 0.138, MediaQuery.of(context).size.height * 0.38),*/
                        child: const Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      /*MediaQuery.of(context).size.height * 0.022, MediaQuery.of(context).size.height * 0.17,MediaQuery.of(context).size.height * 0.16,
                   MediaQuery.of(context).size.height * 0.23),*/
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.327,
                        child: TextField(
                          controller: date,

                          //editing controller of this TextField
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.02)),
                            // ignore: prefer_const_constructors

                            //height: MediaQuery.of(context).size.height*0.038,
                            //width: MediaQuery.of(context).size.height*,

                            fillColor: const Color.fromARGB(255, 186, 231, 235),
                            filled: true,
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.0026),

                            suffixIcon: Icon(Icons.arrow_drop_down),
                            //icon of text field
                            labelText:
                                "Date", //labelStyle: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.036)//label text of field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              /* print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate=DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);*/ //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement
                              setState(() {
                                date.text = DateFormat('yyyy-MM-dd').format(
                                    pickedDate); //set output date to TextField value.
                              });
                            } else {
                              // ignore: avoid_print
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.033,
                        width: MediaQuery.of(context).size.height * 0.22,
                        alignment: Alignment.topLeft,
                        /* padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.023,
                             MediaQuery.of(context).size.height * 0.025, MediaQuery.of(context).size.height * 0.138, MediaQuery.of(context).size.height * 0.38),*/
                        child: const Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.023),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.2,
                        child: TextField(
                          controller: time,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.02)),
                            // ignore: prefer_const_constructors
                            fillColor: const Color.fromARGB(255, 186, 231, 235),
                            filled: true,
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            //icon of text field
                            labelText:
                                "Time", //labelStyle: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.036)
                            //label text of field
                          ),

                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );
                            //
                            // if (pickedTime != null) {//output 10:51 PM
                            //   DateTime parsedTime = DateFormat.jm().parse(
                            //       pickedTime.format(context).toString());
                            //   //converting to DateTime so that we can further format on different pattern.//output 1970-01-01 22:53:00.000
                            //   String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                            //   print(formattedTime); //output 14:59:00
                            //   //DateFormat() is from intl package, you can format the time on any pattern you need.
                            if (pickedTime != null) {
                              setState(() {
                                time.text =
                                    "${pickedTime.hour}:${pickedTime.minute}"; //set the value of text field.
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Color(0xFF6CAFB4),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                /*borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.02)*/
                                ),
                            primary: Color(0xFF6CAFB4)),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        onPressed: (() {
                          // print(orgName.text);
                          // print(date.text);
                          // print(time.text);
                          Map<String, dynamic> vData = {
                            "orgName": orgName.text,
                            "date": date.text,
                            "time": time.text,
                          };
                          if (orgName.text == "" ||
                              date.text == "" ||
                              time.text == "") {
                            print("something missing");
                          } else {
                            fd.postVolunteerData(vData);
                          }
                          const MessageDialog(
                            title: 'Thank you!',
                            contentText:
                                'Thank you,for giving your precious time',
                            imageUrl: 'images/imageUrl.jpeg',
                          );
                        }),
                      ),
                    )

                    // ignore: missing_required_param
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
    );
  }
}
