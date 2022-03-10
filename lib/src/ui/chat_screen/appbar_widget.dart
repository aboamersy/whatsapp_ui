import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/ui_constants.dart';
import 'package:whatsapp_ui/src/ui/widgets/contact_photo_circle_avatar_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.name,
    required this.photoPath,
    required this.lastseen,
    required this.onArrowPress,
  }) : super(key: key);
  final String name;
  final String photoPath;
  final String lastseen;
  final Function onArrowPress;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => onArrowPress(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ContactPhotoCircleAvatarWidget(
              size: 33,
              image: photoPath,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.white, fontSize: kHeaderTextStyle.fontSize),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                lastseen,
                style: TextStyle(
                    color: Colors.white, fontSize: kNTextStyle.fontSize),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        Icon(
          Icons.video_call,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.phone,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size(double.infinity, 56);
}
