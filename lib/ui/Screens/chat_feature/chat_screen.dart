import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../colors.dart';
import 'message_stream.dart';

class ChatScreen extends StatelessWidget {
  static const String id = 'chat_screen';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        onModelReady: (model) => model.openChatStream(),
        viewModelBuilder: () => ChatViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: kTextColor,
                    ),
                    onPressed: model.logout),
              ],
              title: Text(
                model.currentUser ?? "",
                style: TextStyle(color: kTextColor),
              ),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: ListView( children: [
                        MessagesStream(),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.76,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: model.messageTextController,
                              maxLines: null,
                              decoration: InputDecoration(
                                  prefixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.person,
                                        color: kTextColor,
                                      )),
                                  hintText: 'Type Message',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 8, bottom: 10, right: 12, top: 14),
                                  suffixIcon: Icon(
                                    Icons.camera_alt,
                                    color: kTextColor,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: model.sendMessage,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: kSignUpButtonColor,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}





