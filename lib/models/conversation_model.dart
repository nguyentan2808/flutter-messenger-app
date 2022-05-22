import 'package:json_annotation/json_annotation.dart';

part "conversation_model.g.dart";

@JsonSerializable()
class ConversationModel {
  @JsonKey(name: '_id')
  String id;
  String theme;
  List<UserDetailModel> users;

  ConversationModel(this.id, this.theme, this.users);

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  @override
  String toString() {
    return 'id: $id, theme: $theme, users: $users';
  }
}

@JsonSerializable()
class UserDetailModel {
  String username;
  String nickname;
  String name;
  String avatar;

  UserDetailModel(this.username, this.nickname, this.avatar, this.name);

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);
}
