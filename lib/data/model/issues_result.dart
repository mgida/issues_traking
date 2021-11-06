import 'package:json_annotation/json_annotation.dart';
import 'package:tasks/data/model/labels.dart';
import 'package:tasks/data/model/pull_request.dart';
import 'package:tasks/data/model/reactions.dart';
import 'package:tasks/data/model/user.dart';


part 'issues_result.g.dart';

@JsonSerializable()
class IssuesResult {
  String? url;

  @JsonKey(name: 'repository_url')
  String? repositoryUrl;

  @JsonKey(name: 'labels_url')
  String? labelsUrl;

  @JsonKey(name: 'comments_url')
  String? commentsUrl;

  @JsonKey(name: 'events_url')
  String? eventsUrl;

  @JsonKey(name: 'html_url')
  String? htmlUrl;

  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  int? number;
  String? title;
  User? user;
  List<Labels>? labels;
  String? state;
  bool? locked;
  int? comments;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'closed_at')
  String? closedAt;
  @JsonKey(name: 'author_association')
  String? authorAssociation;
  @JsonKey(name: 'pull_request')
  PullRequest? pullRequest;
  String? body;
  Reactions? reactions;
  @JsonKey(name: 'timeline_url')
  String? timelineUrl;

  IssuesResult({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.pullRequest,
    this.body,
    this.reactions,
    this.timelineUrl,
  });

  factory IssuesResult.fromJson(Map<String, dynamic> json) => _$IssuesResultFromJson(json);

  Map<String, dynamic> toJson() => _$IssuesResultToJson(this);

}
