import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 87, 87, 87),
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400)),
          ),
          controller: myController,
          textStyle: WidgetStateProperty.all(
            TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          leading: Container(
            child: Image.asset(
              "assets/Images/Icons/SearchIcon.png",
              width: 18,
              height: 18,
            ),
            padding: EdgeInsets.only(left: 10),
          ),
          backgroundColor:
              WidgetStateProperty.all(Color.fromRGBO(248, 248, 248, 1)),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ));
  }
}
