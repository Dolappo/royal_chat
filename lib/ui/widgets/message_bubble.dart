import 'package:flutter/material.dart';
import 'package:royal_chat/extension.dart';
import '../../colors.dart';
import '../../core/model/chat_model.dart';

class MessageBubble extends StatelessWidget {
  final ChatModel model;
  final bool isMe;
  MessageBubble({required this.model, this.isMe = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              '${model.user}',
              style: TextStyle(fontSize: 8, color: Colors.grey),
            ),
            Material(
                elevation: 3,
                borderRadius: isMe
                    ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
                    : BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: isMe ? kLoginButtonColor : kBackgroundColor,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        '${model.text}',
                      ),Text(
                        textAlign: TextAlign.right,
                        '${model.timeStamp!.toTime()}',
                          style: TextStyle(fontSize: 8)
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}