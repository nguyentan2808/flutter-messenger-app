// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['_id'] as String,
      json['username'] as String,
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['avatar'] as String,
      json['coverPhoto'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'phone': instance.phone,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'coverPhoto': instance.coverPhoto,
      'status': instance.status,
    };
