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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black, // The color of the header background
                onPrimary: Colors.white, // The color of the header text
                onSurface: Colors.black, // The color of the date text
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      Colors.black, // The color of the text buttons
                ),
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
      ],
    );
  }
}
