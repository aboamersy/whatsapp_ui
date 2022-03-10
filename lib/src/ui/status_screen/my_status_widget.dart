import 'package:flutter/material.dart';
import 'package:whatsapp_ui/src/ui/ui_constants.dart';

class MyStatusWidget extends StatelessWidget {
  final bool isStatusOn;
  const MyStatusWidget({
    Key? key,
    this.isStatusOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Ink(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatarWidget(status: isStatusOn),
              const MyStatusText(),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, bottom: 12),
      child: CircleAvatar(
        radius: 30,
        backgroundColor:
            status ? Colors.greenAccent.shade400 : Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.blueGrey.shade400,
          radius: 25,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                bottom: -10,
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white70,
                ),
              ),
              Positioned(
                  right: -5,
                  bottom: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal.shade400,
                    radius: 10,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatusText extends StatelessWidget {
  const MyStatusText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'My status',
          style: kHeaderTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Tap to add status update',
          style: kNTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
