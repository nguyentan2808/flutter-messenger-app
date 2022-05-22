// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      json['conversationId'] as String,
      json['sender'] as String,
      json['content'] as String,
      json['isText'] as bool,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'sender': instance.sender,
      'content': instance.content,
      'isText': instance.isText,
    };
