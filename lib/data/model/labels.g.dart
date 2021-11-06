// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Labels _$LabelsFromJson(Map<String, dynamic> json) => Labels(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LabelsToJson(Labels instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
    };
