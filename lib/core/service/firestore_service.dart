import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royal_chat/core/service/auth_service.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_screen.dart';

import '../../app/app_setup.locator.dart';
import '../model/chat_model.dart';

class FirestoreService {
  final _auth = locator<AuthService>();
  final FirebaseFirestore _fStore = FirebaseFirestore.instance;
  final String messagesPath = "Messages";
  String? userEmail;
  Stream<List<ChatModel>>? chatStream;
  CollectionReference<Map<String, dynamic>> get messageCollection =>
      _fStore.collection(messagesPath);

  Future<List<Map<String, dynamic>>?> streamMessages(
      String chatPartnerMail) async {
    print("User email: $userEmail");
    chatStream = _fStore
        .collection(messagesPath)
        // .orderBy("timeStamp")
        .where("user", whereIn: [chatPartnerMail, userEmail!])
        .snapshots()
        .map((event) {
          if (event.docs.isNotEmpty) {
            return event.docs.map((e) {
              print(e.data());
              ChatModel chat = ChatModel.fromJson(e.data());
              return chat;
            }).toList();
          } else {
            return [];
          }
        });
  }
}
