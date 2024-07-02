import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Counter extends StatefulWidget {
  const Counter(
      {super.key,
      required this.Title,
      required this.DataChange,
      this.defaultValue});

  final String Title;
  final void Function(String?) DataChange;
  final String? defaultValue;
  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  int? _counter = 0;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.defaultValue!.isNotEmpty) {
      setState(() {
        _counter = int.parse(widget.defaultValue ?? "0");
      });
    }
  }

  IncrementCount(int? count) {
    widget.DataChange((_counter! + count!).toString());
    setState(() {
      _counter = _counter! + count!;
    });
  }

  DecrementCount(int? count) {
    widget.DataChange((_counter! - count!).toString());
    setState(() {
      _counter = _counter! - count!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.Title,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: Container(
              width: 311, // Full width
              height: 47, // Set height
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(153, 153, 153, 1), width: 0.5),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        DecrementCount(1);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(10),
                        width: 29,
                        height: 29,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 226, 226, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "-",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _counter.toString(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    InkWell(
                      onTap: () {
                        IncrementCount(1);
                      },
                      child: Container(
                          // margin: EdgeInsets.only(10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 17,
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
