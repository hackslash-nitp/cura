import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cura/shared/widgets/gradient_background.dart';
import 'package:cura/shared/widgets/navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:cura/shared/services/firebase_database.dart';
import 'package:intl/intl.dart';
//import 'package:cura/shared/widgets/message_dialog.dart';

class SpendTime extends StatefulWidget {
  static const String routeName = '/SpendTime';

  const SpendTime({super.key});

  @override
  State<SpendTime> createState() => _SpendTimeState();
}

class _SpendTimeState extends State<SpendTime> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController orgName = TextEditingController();

  FirestoreDatabase fd = FirestoreDatabase();
  List<SearchFieldListItem<dynamic>> organisationNames = [];

  CollectionReference spend = FirebaseFirestore.instance.collection('spend');

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor:const Color(0xFF6CAFB4),
        title: const Text(
          "Spend Time",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        const BiDirectionalBackground(),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Image.asset("assets/spendTime.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2EFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          MediaQuery.of(context).size.width * 0.063),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      // ignore: sized_box_for_whitespace
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: const Text(
                          'Select Organization',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),

                      // ignore: missing_required_param
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 2.0,
                            bottom: 2.0,
                            left: 10.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.8, color: Colors.black),
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color.fromARGB(255, 186, 231, 235),
                          ),
                          child: SearchField(
                            hint: " Enter organisation's name",
                            suggestions: organisationNames,
                            controller: orgName,
                            searchInputDecoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ),

                            //hintText: 'Time',
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.0026),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: const Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: date,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            // ignore: prefer_const_constructors

                            //height: MediaQuery.of(context).size.height*0.038,
                            //width: MediaQuery.of(context).size.height*,

                            fillColor: const Color.fromARGB(255, 186, 231, 235),
                            filled: true,
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.0026),

                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            //icon of text field
                            labelText: " Select Date",
                            //labelStyle: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.036)//label text of field
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

                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: const Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: time,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            // ignore: prefer_const_constructors
                            fillColor: const Color.fromARGB(255, 186, 231, 235),
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            //icon of text field
                            labelText:
                                " Select Time", //labelStyle: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.036)
                            //label text of field
                          ),

                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );
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
                      const SizedBox(height: 10.0),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFF729CA3),
                            ),
                            onPressed: (()
                                // async
                                {
                              // await spend.add({
                              //   'organizationname': orgName.text,
                              //   date: date.text,
                              //   time: time.toString(),
                              // });

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
                              // const MessageDialog(
                              //   title: 'Thank you!',
                              //   contentText:
                              //       'Thank you,for giving your precious time',
                              //   imageUrl: 'images/imageUrl.jpeg',
                              // );

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(10),
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.all(15),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            height: 350,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.asset(
                                                    'assets/main_assets/Completed.png',
                                                    width: 200,
                                                    height: 200,
                                                  ),
                                                ),
                                                // ignore: prefer_const_constructors
                                                SizedBox(height: 10),
                                                // ignore: prefer_const_constructors
                                                Text(
                                                  'Thank You !!',
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      color: Color.fromARGB(
                                                          255, 137, 184, 189),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                // ignore: prefer_const_constructors
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // ignore: prefer_const_constructors
                                                Text(
                                                  'Thank You for giving your precious time',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 0, 10, 11),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  });
                            }),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )

                      // ignore: missing_required_param
                    ],
                  ),
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
