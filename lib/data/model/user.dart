


import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? login;
  int? id;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  @JsonKey(name: 'followers_url')
  String? followersUrl;

  @JsonKey(name: 'following_url')
  String? followingUrl;

  @JsonKey(name: 'starred_url')
  String? starredUrl;

  @JsonKey(name: 'repos_url')
  String? reposUrl;

  String? type;

  User({
    this.login,
    this.id,
    this.avatarUrl,
    this.followersUrl,
    this.followingUrl,
    this.starredUrl,
    this.reposUrl,
    this.type,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}