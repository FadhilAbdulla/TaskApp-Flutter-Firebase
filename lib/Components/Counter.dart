import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.Title});

  final String Title;
  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  int? _counter = 0;

  IncrementCount(int? count) {
    setState(() {
      _counter = _counter! + count!;
    });
  }

  DecrementCount(int? count) {
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
          style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 180, 180, 180),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: double.infinity, // Full width
            height: 40, // Set height
            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 180, 180, 180)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      DecrementCount(1);
                    },
                    child: Container(
                        // margin: EdgeInsets.only(10),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 210, 210, 210),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                          size: 17,
                        )),
                  ),
                  Text(
                    _counter.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
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
      ],
    );
  }
}
