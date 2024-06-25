import 'package:flutter/material.dart';

class ProfileImageAvatar extends StatefulWidget {
  const ProfileImageAvatar({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<ProfileImageAvatar> createState() => _ProfileImageAvatar();
}

class _ProfileImageAvatar extends State<ProfileImageAvatar> {
  final myController = TextEditingController();
  final placeholder = "sample text";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, // Adjust width and height to control the size of the image
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(255, 240, 240, 240), // Set border color here
          width: 2, // Set border width here
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            widget.imageUrl,
          ),
        ),
      ),
    );
  }
}
