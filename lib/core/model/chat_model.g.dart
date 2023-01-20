// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      text: json['text'] as String?,
      user: json['user'] as String?,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'user': instance.user,
      'text': instance.text,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'imgUrl': instance.imgUrl,
    };
