import 'package:json_annotation/json_annotation.dart';

part 'reactions.g.dart';

@JsonSerializable()
class Reactions {
  String? url;

  @JsonKey(name: 'total_count')
  int? totalCount;

  int? laugh;
  int? hooray;
  int? confused;
  int? heart;
  int? rocket;
  int? eyes;

  Reactions({
    this.url,
    this.totalCount,
    this.laugh,
    this.hooray,
    this.confused,
    this.heart,
    this.rocket,
    this.eyes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => _$ReactionsFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionsToJson(this);

}
