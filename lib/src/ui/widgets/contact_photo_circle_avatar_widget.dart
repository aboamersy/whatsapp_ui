import 'package:flutter/material.dart';

class ContactPhotoCircleAvatarWidget extends StatelessWidget {
  const ContactPhotoCircleAvatarWidget({
    Key? key,
    this.size = 35,
    required this.image,
  }) : super(key: key);
  final double size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: size,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 12),
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: size - 10,
        ),
      ),
    );
  }
}
