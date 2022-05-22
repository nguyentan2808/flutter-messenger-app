import 'package:json_annotation/json_annotation.dart';

part "message_model.g.dart";

@JsonSerializable()
class MessageModel {
  String conversationId;
  String sender;
  String content;
  bool isText;

  MessageModel(this.conversationId, this.sender, this.content, this.isText);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
