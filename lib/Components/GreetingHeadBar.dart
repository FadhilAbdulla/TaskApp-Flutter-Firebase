import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingHeadBar extends StatefulWidget {
  const GreetingHeadBar(
      {super.key,
      required this.UserName,
      required this.Active,
      required this.NotificationActive});

  final String UserName;
  final bool Active;
  final bool NotificationActive;

  @override
  State<GreetingHeadBar> createState() => _GreetingHeadBar();
}

class _GreetingHeadBar extends State<GreetingHeadBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Good Morning, ${widget.UserName}!',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontFamily: "Montserrat",
                            fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(248, 248, 248, 1)),
                        color: widget.Active
                            ? Color.fromRGBO(252, 78, 67, 1)
                            : Color.fromRGBO(67, 252, 108, 1),
                      ),
                    )
                  ],
                ),
                Text("Let's Start your task",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16))),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 8),
                  child: Image.asset(
                    "assets/Images/Icons/UserTimeLine.png",
                    width: 21,
                    height: 21,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/notification');
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 248, 248),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          "assets/Images/Icons/Notification.png",
                          width: 23,
                          height: 23,
                        ),
                      ),
                      if (widget.NotificationActive)
                        Positioned(
                            top: 9,
                            left: 21,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(248, 248, 248, 1)),
                                  color: Color.fromRGBO(252, 78, 67, 1)),
                            ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
