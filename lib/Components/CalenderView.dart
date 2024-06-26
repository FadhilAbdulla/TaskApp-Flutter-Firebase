import 'package:flutter/material.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({
    super.key,
  });

  @override
  State<CalenderView> createState() => _CalenderView();
}

class _CalenderView extends State<CalenderView> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 241,
        width: 332,
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
        margin: EdgeInsets.only(bottom: 10),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // The color of the header background
              onPrimary: Colors.white, // The color of the header text
              onSurface:
                  Color.fromARGB(255, 52, 52, 52), // The color of the date text
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // The color of the text buttons
              ),
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              titleSmall: TextStyle(
                  fontSize: 16.0, color: Color.fromARGB(255, 52, 52, 52)),
            ),
          ),
          child: CalendarDatePicker(
            firstDate: DateTime(2000),
            initialDate: _selectedDate,
            lastDate: DateTime(2100),
            onDateChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        ),
      ),
    );
  }
}
