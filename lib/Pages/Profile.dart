import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Components//ResponsiveButton.dart';

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

  void Logout() {
    Navigator.of(context).pushReplacementNamed('/signin');
  }

  void ClickedLogout() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.white,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const Text("Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  const Text("Are you sure you want to logout ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 55, 55, 55),
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: ResponsiveButton(
                      blackButton: true,
                      textinside: "Yes",
                      onButtonTap: Logout,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: ResponsiveButton(
                      blackButton: false,
                      textinside: "No",
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Column(
            children: [
              Text(
                widget.UserName,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
              color:
                  const Color.fromARGB(255, 255, 255, 255), // Background color
              borderRadius: BorderRadius.circular(10), //
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(146, 158, 158, 158).withOpacity(0.5),
                  spreadRadius: -4,
                  blurRadius: 40,
                  offset: Offset(0, 12), // changes position of shadow
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
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color.fromARGB(255, 87, 87, 87)),
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
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
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
                InkWell(
                  onTap: () {
                    ClickedLogout();
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.login_outlined,
                        size: 30.0,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color.fromARGB(255, 87, 87, 87),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
