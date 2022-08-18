import "package:flutter/material.dart";
import 'package:anim_search_bar/anim_search_bar.dart';

class UserChatsPage extends StatelessWidget {
  const UserChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:Alignment.bottomCenter,

          colors:[
            Color(0xFFA2D2D5),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: Color(0xFFC7E2E4),
          ),
          height: 60.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.home_filled,
                  color: Color.fromARGB(255, 41, 159, 168),
                ),
              ),
              //SizedBox(width: 10),
              MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.add_box_outlined,
                ),
              ),
              //SizedBox(width: 10),
              MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.message_outlined,
                ),
              ),
              //SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_outline,
                ),
              ),
            ],
          ),
        ),


        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15.0,
                      )),
                  Text(
                    "My Chats",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 48.0,
                  ),
                ],
              ),

              SearchBar(),

              Column(
                children:[
                  AddContactWidget("Alpha Male Old Age Home","assets/Heart.png"),
                  AddContactWidget("Alpha Male Old Age Home","assets/Heart.png"),
                  SizedBox(height:10.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddContactWidget extends StatelessWidget {
  String contactName;
  String imagePath;
  AddContactWidget(this.contactName,this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        onTap: (){
          //Required function goes here,
        },
        tileColor: Color(0xFFE0EEEF),
        contentPadding: EdgeInsets.symmetric(vertical: 2.0,horizontal:5.0),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading:CircleAvatar(
          radius: 25.0,
          child:Image.asset(imagePath),
        ),
        title:Text(
            "$contactName",
          style:TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          )
        ),
        trailing: Icon(Icons.arrow_forward_ios,size:15.0),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimSearchBar(
          width: 400.0,
          textController:TextEditingController(),
          onSuffixTap: (){},
      ),
    );
  }
}
