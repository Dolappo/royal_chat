import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:royal_chat/extension.dart';
import 'package:stacked/stacked.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/model/chat_model.dart';
import '../../widgets/message_bubble.dart';
import 'chat_view_model.dart';

class MessagesStream extends HookWidget {
  final ChatViewModel viewModel;
  MessagesStream({required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatModel>>(
        stream: viewModel.chatStream,
        builder: (context, snapshot) {
          print("first user: ${snapshot.data?.first.user}");
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<ChatModel> messages = snapshot.data!;
            return GroupedListView<ChatModel, DateTime>(
              useStickyGroupSeparators: true,
              shrinkWrap: true,
              elements: messages,
              groupBy: (type) => type.timeStamp!.toDateTimeDate(),
              groupComparator: (group1, group2) => group1.compareTo(group2),
              itemComparator: (item1, item2) => item1.timeStamp!
                  .toDate()
                  .compareTo(item2.timeStamp!.toDate()),
              groupSeparatorBuilder: (DateTime date) {
                return ChatDateSep(date: getDateSeparator(date));
              },
              indexedItemBuilder: (context, ChatModel model, index) {
                if (model.imgUrl != null) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: model.imgUrl!,
                            placeholder: (context, url) => Center(
                                child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(model.text ?? ""),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(model.timeStamp!.toTime()))
                      ],
                    ),
                  );
                } else {
                  return MessageBubble(
                      model: model,
                      isMe: messages[index].user == viewModel.currentUser);
                }
              },
            );
          }

          // print("Streamed data: ${messages[3].timeStamp}");
        }
        // },
        );
  }
}

class ChatDateSep extends StatelessWidget {
  final String date;
  const ChatDateSep({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

String getDateSeparator(DateTime date) {
  if (date.isToday()) {
    return "Today";
  } else if (date.isYesterday()) {
    return "Yesterday";
  } else {
    return date.toDate();
  }
}
