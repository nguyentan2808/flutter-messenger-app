import 'package:json_annotation/json_annotation.dart';

part "message_model.g.dart";

@JsonSerializable()
class MessageModel {
  String conversationId;
  String sender;
  String content;
  bool isText;

  MessageModel.formMock(
      this.conversationId, this.sender, this.content, this.isText);

  MessageModel(this.conversationId, this.sender, this.content, this.isText);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  String toString() {
    return 'MessageModel{conversationId: $conversationId, sender: $sender, content: $content, isText: $isText}';
  }
}
