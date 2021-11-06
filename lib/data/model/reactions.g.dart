// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      url: json['url'] as String?,
      totalCount: json['total_count'] as int?,
      laugh: json['laugh'] as int?,
      hooray: json['hooray'] as int?,
      confused: json['confused'] as int?,
      heart: json['heart'] as int?,
      rocket: json['rocket'] as int?,
      eyes: json['eyes'] as int?,
    );

Map<String, dynamic> _$ReactionsToJson(Reactions instance) => <String, dynamic>{
      'url': instance.url,
      'total_count': instance.totalCount,
      'laugh': instance.laugh,
      'hooray': instance.hooray,
      'confused': instance.confused,
      'heart': instance.heart,
      'rocket': instance.rocket,
      'eyes': instance.eyes,
    };
