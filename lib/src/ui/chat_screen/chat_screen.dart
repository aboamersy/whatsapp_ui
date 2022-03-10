import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/chat_screen/appbar_widget.dart';
import 'package:whatsapp_ui/src/ui/chat_screen/bottom_bar_widget.dart';
import 'package:whatsapp_ui/src/ui/chat_screen/message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.lastseen,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String lastseen;
  final String image;
  final String name;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade300,
        appBar: AppBarWidget(
          lastseen: widget.lastseen,
          name: widget.name,
          photoPath: widget.image,
          onArrowPress: onPress,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    MessageWidget(
                      message: 'Hi',
                      time: '13/3',
                      isSender: true,
                      status: 2,
                    ),
                    MessageWidget(
                      message: 'Hello there !',
                      time: '13/3',
                      isSender: false,
                    ),
                    MessageWidget(
                      message:
                          'Did you know,that Flutter is so powerfull and amazing!',
                      time: '13/3',
                      isSender: true,
                      status: 2,
                    ),
                    MessageWidget(
                      message:
                          'it\'s indeed!\nthe best app development framwork',
                      time: '13/3',
                      isSender: false,
                    ),
                    MessageWidget(
                      message: 'Exactly!',
                      time: '13/3',
                      isSender: true,
                      status: 1,
                    ),
                    MessageWidget(
                      message: 'Where did you go?',
                      time: '13/3',
                      isSender: true,
                      status: 0,
                    ),
                  ],
                ),
              ),
              const BottomBarWidget(),
            ],
          ),
        ));
  }

  void onPress() {
    Navigator.pop(context);
  }
}
