import "package:flutter/material.dart";

class SupportPage extends StatelessWidget {
  static const routeName = "/SupportPage";
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
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
              child: const Icon(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  "Support Team",
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
            Image.asset("assets/support.png"),
            Text(
              "How can we help\n you?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  //Enter the required function here
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF7E9FE8), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                tileColor: Color(0xFFE0EEEF),
                title: Text("Contact Live Chat",
                    style: TextStyle(fontWeight: FontWeight.w700)),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: 15.0, color: Color(0xFF49ADF4)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 36.0,
                  child: Icon(Icons.email_outlined, color: Color(0xFF49ADF4)),
                  backgroundColor: Color(0xFFE0EEEF),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Send us an email",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "info@curo.io",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
          ],
        ),
      ),
    );
  }
}
