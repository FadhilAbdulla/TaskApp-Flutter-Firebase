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
          return NewTaskModal();
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Time Line',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,

        selectedItemColor: Colors.black, // Color for selected item icon
        unselectedItemColor: Colors.grey, // Color for unselected item icons
        onTap: _onItemTapped,
        showSelectedLabels: true, // To show labels for selected item
        showUnselectedLabels: false, // To hide labels for unselected items
        type: BottomNavigationBarType.fixed, // To disable shifting animation
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
