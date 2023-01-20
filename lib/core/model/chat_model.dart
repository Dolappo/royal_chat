
import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
   String? user;
   String? text;
   DateTime? timeStamp;
   String? imgUrl;
  ChatModel({
    this.text,
    this.user,
    this.timeStamp,
    this.imgUrl
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);

}
