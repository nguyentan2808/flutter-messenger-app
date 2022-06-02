// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    ConversationModel(
      json['_id'] as String,
      json['theme'] as String,
      (json['users'] as List<dynamic>)
          .map((e) => UserDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['lastMessage'] == null
          ? null
          : MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'theme': instance.theme,
      'users': instance.users,
      'lastMessage': instance.lastMessage,
    };

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      json['username'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'nickname': instance.nickname,
      'name': instance.name,
      'avatar': instance.avatar,
    };
