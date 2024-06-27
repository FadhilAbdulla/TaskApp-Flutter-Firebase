import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultHeader extends StatefulWidget {
  const DefaultHeader(
      {super.key,
      required this.header,
      required this.BackButtonPresent,
      required this.SettingsButtonPresent,
      this.onSettingsTap});

  final String header;
  final bool SettingsButtonPresent;
  final bool BackButtonPresent;
  final VoidCallback? onSettingsTap;

  @override
  State<DefaultHeader> createState() => _DefaultHeader();
}

class _DefaultHeader extends State<DefaultHeader> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget.BackButtonPresent
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: Container(
                      height: 29,
                      width: 29,
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
                    ),
                  )
                : SizedBox(
                    width: 29,
                  ),
            Text(widget.header,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16))),
            widget.SettingsButtonPresent
                ? InkWell(
                    onTap: () {
                      widget.onSettingsTap!();
                    },
                    child: Container(
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
                    ),
                  )
                : SizedBox(
                    width: 30,
                  ),
          ],
        ));
  }
}
