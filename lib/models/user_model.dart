import 'package:json_annotation/json_annotation.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel {
  String username;
  String phone;
  String id;
  String name;
  String email;
  String? avatar;
  String? coverPhoto;
  String? status;

  UserModel.fromMock({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    this.coverPhoto,
    this.status,
  });

  UserModel(
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.coverPhoto,
    this.status,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
