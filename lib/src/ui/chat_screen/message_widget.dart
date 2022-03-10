import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;

  // 0 => sent , 1 -> recieved , 2 -> read
  final int status;
  const MessageWidget({
    Key? key,
    this.message = '',
    this.time = '',
    this.isSender = false,
    this.status = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: MediaQuery.of(context).size.width - 50,
            minHeight: 30),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xffDEF8CA) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isSender ? const Radius.circular(8) : Radius.zero,
            topRight: !isSender ? const Radius.circular(8) : Radius.zero,
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 60, top: 6, bottom: 10, left: 10),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 3,
              child: Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Visibility(
                    visible: isSender,
                    child: Icon(
                      status == 0 ? Icons.done : Icons.done_all,
                      size: 20,
                      color: status == 0 || status == 1
                          ? Colors.grey
                          : Colors.blue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
