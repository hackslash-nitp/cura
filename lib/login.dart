import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.teal,
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                stops:[0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        title: const Text(
            "Log in", style:TextStyle(fontSize: 24.0 , color: Colors.black,fontWeight: FontWeight.bold)
        ),
      ),
      body:
      Container(

        width:double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/cura-logo.png',height:160.0 ,width:256.0 ),
            const Text(
              "Hello! ",

              style: TextStyle(fontWeight: FontWeight.bold, fontSize:16.0 ),
            ),
            const Text(
              "Welcome Back to Cura",

              style: TextStyle(fontWeight: FontWeight.bold, fontSize:16.0 ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center
              ,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height:38.0 ,
                  width: 141.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child:const Text(
                      "Phone No.",
                      style: TextStyle(
                        fontSize:18.0 ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height:38.0 ,
                  width: 141.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFA2D2D5)

                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child:const Text(
                      "Email",
                      style: TextStyle(
                        fontSize:18.0 ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 25,
            ),



            Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                MaterialButton(
                  minWidth: 305,
                  height: 45,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "9999999999",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: (16.0),
                    ),

                  ),



                ),
                const SizedBox(
                  height: 30,
                ),

                MaterialButton(
                  minWidth: 305,
                  height: 45,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text(
                    "xxxx",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: (16.0),
                    ),

                  ),




                ),
                const SizedBox(
                  height: 25,
                ),

                Container(
                  height:42.0 ,
                  width: 305.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child:const Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize:18.0 ,
                        color: Colors.white,
                      ),
                    ),
                  ),


                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "New User? ",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize:13.0 ,color: Colors.cyan),
                ),
                const Text(
                  "Sign Up Now ",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize:13.0 ,color: Colors.cyan),
                ),



              ],
            ),


          ],
        ),

      ),
    );
  }
}





