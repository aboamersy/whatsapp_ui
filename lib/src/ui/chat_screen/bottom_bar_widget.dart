import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late Icon fabIcon;

  Icon micIcon = const Icon(
    Icons.mic,
    key: ValueKey(1),
    color: Colors.white,
    size: 25,
  );
  Icon sendIcon = const Icon(
    Icons.send,
    key: ValueKey(2),
    color: Colors.white,
    size: 25,
  );

  @override
  void initState() {
    super.initState();
    toggleMic(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              constraints: const BoxConstraints(minHeight: 50, maxHeight: 400),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.face,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (data) {
                      if (data != '' && fabIcon == micIcon) {
                        toggleMic(false);
                      }

                      if (data == '' && fabIcon == sendIcon) {
                        toggleMic(true);
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    textAlign: TextAlign.start,
                  )),
                  const Icon(
                    Icons.attachment,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.camera,
                    color: Colors.grey,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {},
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: fabIcon),
          ),
        ],
      ),
    );
  }

  void toggleMic(bool mic) {
    setState(() {
      fabIcon = mic ? micIcon : sendIcon;
    });
  }
}
