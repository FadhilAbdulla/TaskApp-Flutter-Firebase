import 'package:flutter/material.dart';

class DefaultHeader extends StatefulWidget {
  const DefaultHeader(
      {super.key,
      required this.header,
      required this.BackButtonPresent,
      required this.SettingsButtonPresent});

  final String header;
  final bool SettingsButtonPresent;
  final bool BackButtonPresent;

  @override
  State<DefaultHeader> createState() => _DefaultHeader();
}

class _DefaultHeader extends State<DefaultHeader> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget.BackButtonPresent
                ? Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  )
                : SizedBox(
                    width: 20,
                  ),
            Text(widget.header,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 16)),
            widget.SettingsButtonPresent
                ? Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  )
                : SizedBox(
                    width: 20,
                  ),
          ],
        ));
  }
}
