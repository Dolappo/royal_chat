import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../core/model/chat_model.dart';
import '../../widgets/message_bubble.dart';
import 'chat_view_model.dart';

class MessagesStream extends ViewModelWidget<ChatViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return StreamBuilder<List<ChatModel>>(
        stream: viewModel.chatStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ChatModel> messages = snapshot.data!;
          return Column(

            children: List.generate(
                messages.length,
                    (index) => MessageBubble(
                    model: messages[index],
                    isMe: messages[index].user == viewModel.currentUser)),
          );
        }
      // },
    );
  }
}