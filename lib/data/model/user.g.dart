// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      login: json['login'] as String?,
      id: json['id'] as int?,
      avatarUrl: json['avatar_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      starredUrl: json['starred_url'] as String?,
      reposUrl: json['repos_url'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'starred_url': instance.starredUrl,
      'repos_url': instance.reposUrl,
      'type': instance.type,
    };
