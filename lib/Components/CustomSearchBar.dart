import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 44,
        child: SearchBar(
          hintText: 'Search your task',
          hintStyle: WidgetStateProperty.all(
            TextStyle(
                color: Color.fromARGB(255, 87, 87, 87),
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400),
          ),
          controller: myController,
          textStyle: WidgetStateProperty.all(
            TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          leading: Container(
            child: Icon(Icons.search, color: Color.fromARGB(255, 87, 87, 87)),
            padding: EdgeInsets.only(left: 10),
          ),
          backgroundColor:
              WidgetStateProperty.all(Color.fromARGB(255, 248, 248, 248)),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ));
  }
}
