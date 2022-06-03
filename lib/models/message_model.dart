import 'package:json_annotation/json_annotation.dart';

part "message_model.g.dart";

@JsonSerializable()
class MessageModel {
  String id;
  String conversationId;
  String sender;
  String content;
  bool isText;
  String reaction;

  // MessageModel.formMock(
  //     this.conversationId, this.sender, this.content, this.isText, );

  MessageModel(this.id, this.conversationId, this.sender, this.content,
      this.isText, this.reaction);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  String toString() {
    return 'MessageModel{id: $id, conversationId: $conversationId, sender: $sender, content: $content, isText: $isText, reaction: $reaction}';
  }
}
