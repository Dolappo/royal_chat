import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:royal_chat/app/app_setup.locator.dart';
import 'package:royal_chat/app/app_setup.router.dart';
import 'package:royal_chat/core/service/auth_service.dart';
import 'package:royal_chat/core/service/chat_service.dart';
import 'package:royal_chat/core/service/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/model/chat_model.dart';
import 'chat_screen.dart';

class ChatViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _chat = locator<ChatService>();
  final _fstore = locator<FirestoreService>();
  final _nav = locator<NavigationService>();

  ChatViewModel() {
    openChatStream();
  }

  TextEditingController messageTextController = TextEditingController();
  String? message;

  String? get currentUser => _fstore.userEmail ?? "";

  Future<void> logout() async {
    await _auth
        .logout()
        .then((value) => _nav.clearStackAndShow(Routes.loginScreen));
  }

  void selectImage() {
    _chat.pickImage()
        .then((value) => _nav.navigateTo(Routes.previewSelectedImage));
  }

  Future<void> sendMessage() async {
    await _fstore.messageCollection.add(ChatModel(
      text: messageTextController.text,
      timeStamp: DateTime.now(),
      user: currentUser,
    ).toJson());
    messageTextController.clear();
    notifyListeners();
  }

  Stream<List<ChatModel>>? get chatStream => _fstore.chatStream;

  Future<void> openChatStream() async {
    print("Opening stream");
    await _fstore.streamMessages("hey@gmail.com");
  }
}
