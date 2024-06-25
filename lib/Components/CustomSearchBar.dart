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
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        height: 50,
        child: SearchBar(
          hintText: 'Search your task',
          hintStyle: WidgetStateProperty.all(
            TextStyle(
                color: Color.fromARGB(255, 220, 220, 220),
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400),
          ),
          controller: myController,
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          leading: Container(
            child:
                Icon(Icons.search, color: Color.fromARGB(255, 220, 220, 220)),
            padding: EdgeInsets.only(left: 10),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          elevation: WidgetStateProperty.all(5),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}
