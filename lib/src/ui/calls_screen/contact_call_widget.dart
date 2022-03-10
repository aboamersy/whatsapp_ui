import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/ui_constants.dart';
import 'package:whatsapp_ui/src/ui/widgets/contact_photo_circle_avatar_widget.dart';

class ContactCallWidget extends StatelessWidget {
  final bool isVideoCall;
  final String image;
  final String name;
  final String date;
  const ContactCallWidget({
    Key? key,
    this.isVideoCall = false,
    required this.image,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          ContactPhotoCircleAvatarWidget(
            image: image,
          ),
          const SizedBox(
            width: 10,
          ),
          ContactNameDateWidget(
            contactName: name,
            callDate: date,
          ),
          CallIconWidget(
            videoCall: isVideoCall,
          ),
        ],
      ),
    );
  }
}

class CallIconWidget extends StatelessWidget {
  final bool videoCall;
  const CallIconWidget({
    Key? key,
    this.videoCall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: (() {}),
        child: Icon(
          videoCall ? Icons.video_call : Icons.call,
          size: 25,
          color: Colors.green,
        ),
      ),
    );
  }
}

class ContactNameDateWidget extends StatelessWidget {
  const ContactNameDateWidget({
    Key? key,
    this.contactName = '',
    this.callDate = '',
  }) : super(key: key);
  final String contactName;
  final String callDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            contactName,
            textAlign: TextAlign.start,
            style: kHeaderTextStyle,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            callDate,
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
