import 'package:json_annotation/json_annotation.dart';
part 'labels.g.dart';

@JsonSerializable()
class Labels {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? url;
  String? name;
  String? color;
  String? description;

  Labels({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.description,
  });

  factory Labels.fromJson(Map<String, dynamic> json) => _$LabelsFromJson(json);

  Map<String, dynamic> toJson() => _$LabelsToJson(this);

}
