import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/chats_screen/contact_chats_screen_widget.dart';
import 'package:whatsapp_ui/src/ui/ui_constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          padding: const EdgeInsets.only(top: 5),
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ChatWidget(
                imagePath: "$kProfilePhotosPath/${1}.jpg",
                senderName: 'Ahmad',
                senderMessage: 'Welcome back bro',
                date: '5:46'),
            ChatWidget(
                imagePath: "$kProfilePhotosPath/${2}.jpg",
                senderName: 'Sara',
                senderMessage: 'Hey there !',
                date: '2:30'),
            ChatWidget(
                imagePath: "$kProfilePhotosPath/${3}.jpg",
                senderName: 'Raymond',
                senderMessage: 'that was awesome ',
                date: '13/12/2022'),
            ChatWidget(
                imagePath: "$kProfilePhotosPath/${4}.jpg",
                senderName: 'Omar',
                senderMessage: 'I also love Flutter xD',
                date: '11/10/2022'),
          ],
        ),
      ),
    );
  }
}
