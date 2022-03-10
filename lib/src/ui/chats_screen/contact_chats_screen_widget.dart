import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/chat_screen/chat_screen.dart';
import 'package:whatsapp_ui/src/ui/ui_constants.dart';
import 'package:whatsapp_ui/src/ui/widgets/contact_photo_circle_avatar_widget.dart';

class ChatWidget extends StatelessWidget {
  final String imagePath;
  final String senderName;
  final String senderMessage;
  final String date;

  const ChatWidget({
    Key? key,
    required this.imagePath,
    required this.senderName,
    required this.senderMessage,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ChatScreen(
                        name: senderName,
                        image: imagePath,
                        lastseen: "online",
                      )));
        },
        child: Ink(
          color: Colors.white,
          child: Row(
            children: [
              ContactPhotoCircleAvatarWidget(
                image: imagePath,
              ),
              ContactNameMessageWidget(
                name: senderName,
                message: senderMessage,
              ),
              MessageDateWidget(
                date: date,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageDateWidget extends StatelessWidget {
  final String date;
  const MessageDateWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 5),
      child: Text(
        date,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}

class ContactNameMessageWidget extends StatelessWidget {
  final String name;
  final String message;
  const ContactNameMessageWidget({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            textAlign: TextAlign.start,
            style: kHeaderTextStyle,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            message,
            style: kNTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
