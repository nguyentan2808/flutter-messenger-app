import 'package:json_annotation/json_annotation.dart';

import '../constants/theme_constant.dart';
import 'message_model.dart';

part "conversation_model.g.dart";

@JsonSerializable()
class ConversationModel {
  @JsonKey(name: '_id')
  String id;
  String theme;
  List<UserDetailModel> users;
  MessageModel? lastMessage;
  String name;

  ConversationModel(
      this.id, this.theme, this.users, this.lastMessage, this.name);

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  @override
  String toString() {
    return 'ConversationModel{id: $id, theme: $theme, users: $users, lastMessage: $lastMessage, name: $name}';
  }
}

@JsonSerializable()
class UserDetailModel {
  String username;
  String nickname;
  String name;
  String avatar;

  UserDetailModel(this.username, this.nickname, this.avatar, this.name);

  static UserDetailModel mockData(String name) {
    return UserDetailModel(
      "clone",
      "clone",
      kDefaultAvatarUrl,
      name,
    );
  }

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);

  @override
  String toString() {
    return 'UserDetailModel{username: $username, nickname: $nickname, name: $name, avatar: $avatar}';
  }
}
