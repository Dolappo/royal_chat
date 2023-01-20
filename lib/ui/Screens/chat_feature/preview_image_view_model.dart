import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:royal_chat/app/app_setup.locator.dart';
import 'package:royal_chat/core/service/chat_service.dart';
import 'package:royal_chat/core/service/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/model/chat_model.dart';

class PreviewImageViewModel extends BaseViewModel{
final _chat = locator<ChatService>();
final _nav = locator<NavigationService>();

  Uint8List? get selectedImage => _chat.webImage;
  TextEditingController textController = TextEditingController();

   Future<void> sendImage() async{
     String? url = await _chat.uploadImageToStorage();
     ChatModel chat = ChatModel(
       text: textController.text,
       user: _chat.currentUser,
       timeStamp: DateTime.now(),
        imgUrl: url,
     );
    await _chat.sendImage(chat).then((value) => _nav.back());
   }


}