import 'package:flutter/material.dart';
import 'package:whatsapp_ui/src/ui/status_screen/my_status_widget.dart';
import 'package:whatsapp_ui/src/ui/status_screen/other_status_widget.dart';
import 'package:whatsapp_ui/src/ui/ui_constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        padding: const EdgeInsets.only(top: 5),
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MyStatusWidget(),
          OtherStatusWidget(
            text: 'Recent updates',
            status: true,
            name: 'Ahmad',
            image: '$kProfilePhotosPath/1.jpg',
            lastSeen: "Today",
          ),
          OtherStatusWidget(
            text: 'Viewed updates',
            status: false,
            image: '$kProfilePhotosPath/2.jpg',
            lastSeen: 'Yesterday',
            name: 'Sara',
          ),
        ],
      ),
    ));
  }
}
