import 'package:flutter/material.dart';
import 'package:whatsapp_ui/src/ui/calls_screen/contact_call_widget.dart';
import 'package:whatsapp_ui/src/ui/ui_constants.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ContactCallWidget(
            image: '$kProfilePhotosPath/1.jpg',
            name: 'Ahmad',
            date: 'Today 12:00 PM',
          ),
          ContactCallWidget(
            isVideoCall: true,
            image: '$kProfilePhotosPath/4.jpg',
            name: 'Raymond',
            date: 'Today 12:00 PM',
          ),
          ContactCallWidget(
            isVideoCall: true,
            image: '$kProfilePhotosPath/3.jpg',
            name: 'Sam',
            date: 'Today 12:00 PM',
          ),
          ContactCallWidget(
            image: '$kProfilePhotosPath/2.jpg',
            name: 'Roua',
            date: 'Today 12:00 PM',
          ),
        ],
      ),
    );
  }
}
