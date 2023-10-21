import 'package:flutter/material.dart';

class DonorPage extends StatelessWidget {
  const DonorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:SafeArea(
       child:Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconButton(
                   onPressed: () {},
                   icon:const  Icon(
                     Icons.arrow_back_ios_new,
                     size: 15.0,
                   ),),
               const Text(
                 "Donor Detail",
                 style: TextStyle(
                   fontSize: 22.0,
                   fontWeight: FontWeight.w700,
                 ),
               ),
               const SizedBox(
                 width: 48.0,
               ),
             ],
           ),
           CircleAvatar(
               radius: 50.0,
               child: Image.asset("assets/Heart.png"),
           ),
           const  SizedBox(height: 10.0),
           const  Text(
             "Shazeb",
             style:TextStyle(
               fontSize: 24.0,
               fontWeight: FontWeight.w700,
             ),
           ),
           const Text(
               "Last Connected 1 month ago",
               style:TextStyle(
                 color: Color(0xFF777474),
               )
             ),
           Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color:const Color(0xFFE0EEEF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:const EdgeInsets.all(10.0),
                    margin:const EdgeInsets.all(10.0),
                    child:const  Text("+1 879 944-4489",textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color:const Color(0xFFE0EEEF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:const EdgeInsets.all(10.0),
                    margin:const EdgeInsets.all(10.0),
                    child: const Text("shazeb12@gmail.com",textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 10.0),
           const Text(
             "Personal Information",
             style:TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.w700,
             ),
           ),
            Expanded(
              flex:3,
              child: Container(
                padding:const  EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0EEEF),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(children: [
                  TwoTexts("Date of birth", "12 May 2022"),
                  TwoTexts("Related Contacts","Wife:Angela Jolie"),
                  TwoTexts("Title","Assistant Manager"),
                  TwoTexts("Department","Management"),
                  TwoTexts("Mailing Address","9945 Watthem Street,NewYork,USA"),
                  TwoTexts("Company","Best Buy"),
                  TwoTexts("Company Address","3345 Block Rd Ave,Austi TX 78499"),
                ],
                ),
              ),
            ),
          const  Text(
             "Administrative Details",
             style:TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.w700,
             ),
           ),
           Expanded(
             child: Container(
               padding:const  EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
               margin: const EdgeInsets.all(10.0),
               decoration: BoxDecoration(
                 color:const  Color(0xFFE0EEEF),
                 borderRadius: BorderRadius.circular(15.0),
               ),
               child: Column(children: [
                 TwoTexts("Added", "14 Dec 2019"),
                 TwoTexts("Total Donations","\$  5522"),
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

class TwoTexts extends StatelessWidget {

  String heading;
  String text;

  TwoTexts(this.heading,this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              heading,
              style:const  TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
      textAlign: TextAlign.end,
              style:const  TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


