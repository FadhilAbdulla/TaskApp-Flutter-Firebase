import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';

class ImageOverlap extends StatefulWidget {
  const ImageOverlap({super.key, required this.ImageUrlList});

  final List ImageUrlList;

  @override
  State<ImageOverlap> createState() => _ImageOverlap();
}

class _ImageOverlap extends State<ImageOverlap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 100,
        ),
        Positioned(
          child: ProfileImageAvatar(
            imageUrl: widget.ImageUrlList[0],
          ),
        ),
        Positioned(
          left: 20,
          child: ProfileImageAvatar(
            imageUrl: widget.ImageUrlList[1],
          ),
        ),
        Positioned(
          left: 40,
          child: ProfileImageAvatar(
            imageUrl: widget.ImageUrlList[2],
          ),
        ),
        Positioned(
          left: 40,
          child: ProfileImageAvatar(
            imageUrl: widget.ImageUrlList[2],
          ),
        ),
        Positioned(
            left: 60,
            child: Container(
              width:
                  32, // Adjust width and height to control the size of the image
              height: 32,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(
                      255, 240, 240, 240), // Set border color here
                  width: 2, // Set border width here
                ),
              ),
              child: Center(
                  child: Text(
                "2+",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              )),
            )),
      ],
    );
  }
}
