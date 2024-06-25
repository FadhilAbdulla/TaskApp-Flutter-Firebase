import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.UserName, required this.UserEmail});

  final String UserName;
  final String UserEmail;

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool _darkMode = false;

  void _saveDarkMode(bool value) async {
    setState(() {
      _darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Column(
              children: [
                Text(
                  widget.UserName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  widget.UserEmail,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 35, 30, 15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Background color
                borderRadius: BorderRadius.circular(10), //
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(146, 158, 158, 158)
                        .withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.notifications_outlined,
                        size: 30.0,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Notifications",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13),
                      )
                    ],
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.dark_mode_outlined,
                              size: 30.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13),
                            )
                          ],
                        ),
                        Switch(
                          value: _darkMode,
                          onChanged: (value) {
                            _saveDarkMode(value);
                          },
                          activeColor: const Color.fromARGB(255, 0, 0, 0),
                          inactiveTrackColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ]),
                  Divider(
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.login_outlined,
                        size: 30.0,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
