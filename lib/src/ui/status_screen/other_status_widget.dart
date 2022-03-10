import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/ui_constants.dart';

class OtherStatusWidget extends StatelessWidget {
  final String text;
  final bool visible;
  final bool status;
  final String image;
  final String name;
  final String lastSeen;

  const OtherStatusWidget({
    Key? key,
    this.text = '',
    this.visible = true,
    this.status = false,
    required this.image,
    required this.name,
    required this.lastSeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: kStatusScreenHeaderText,
            ),
          ),
          StatusWidget(
            status: status,
            name: name,
            image: image,
            lastSeen: lastSeen,
          ),
        ],
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    Key? key,
    this.status = false,
    required this.image,
    required this.name,
    required this.lastSeen,
  }) : super(key: key);
  final bool status;
  final String image;
  final String name;
  final String lastSeen;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatarWidget(
                      status: status,
                      image: image,
                    ),
                    ContactNameSeenWidget(
                      name: name,
                      lastSeen: lastSeen,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    Key? key,
    required this.image,
    this.status = false,
  }) : super(key: key);
  final String image;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, bottom: 5),
      child: CircleAvatar(
        radius: 28,
        backgroundColor:
            status ? Colors.greenAccent.shade400 : Colors.transparent,
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 25,
        ),
      ),
    );
  }
}

class ContactNameSeenWidget extends StatelessWidget {
  const ContactNameSeenWidget({
    Key? key,
    required this.name,
    required this.lastSeen,
  }) : super(key: key);
  final String name;
  final String lastSeen;
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
            lastSeen,
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
