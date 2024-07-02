import 'package:flutter/material.dart';
import './HomePage.dart';
import './Projects.dart';
import './TimeLine.dart';
import './Profile.dart';
import '../Components/NewTaskModal.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Projects(),
    Projects(),
    TimeLine(),
    Profile(
      UserName: "Kyle Calica",
      UserEmail: "nathan@mvp-apps.com",
    )
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return NewTaskModal(EditView: false);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Images/Icons/${_selectedIndex == 0 ? "1S" : "1"}.png",
              width: 22,
              height: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Images/Icons/${_selectedIndex == 1 ? "2S" : "2"}.png",
              width: 22,
              height: 22,
            ),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: Colors.black, // Background color for the container
                shape: BoxShape.circle, // Makes the container rounded
              ),
              padding: EdgeInsets.all(8.0), // Padding inside the container
              child: Icon(
                Icons.add,
                size: 30,

                color: Colors.white, // Icon color inside the container
              ),
            ),
            label: '', // Empty label for the add icon
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Images/Icons/${_selectedIndex == 3 ? "3S" : "3"}.png",
              width: 22,
              height: 22,
            ),
            label: 'Time Line',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Images/Icons/${_selectedIndex == 4 ? "4S" : "4"}.png",
              width: 22,
              height: 22,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,

        selectedItemColor: Colors.black, // Color for selected item icon
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: true, // To show labels for selected item
        showUnselectedLabels: true, // To hide labels for unselected items
        type: BottomNavigationBarType.fixed, // To disable shifting animation
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedLabelStyle: TextStyle(
          fontSize: 12, // Set the text size for selected labels
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12, // Set the text size for unselected labels
        ),
      ),
    );
  }
}
