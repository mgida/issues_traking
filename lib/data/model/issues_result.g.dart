// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuesResult _$IssuesResultFromJson(Map<String, dynamic> json) => IssuesResult(
      url: json['url'] as String?,
      repositoryUrl: json['repository_url'] as String?,
      labelsUrl: json['labels_url'] as String?,
      commentsUrl: json['comments_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      htmlUrl: json['html_url'] as String?,
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      number: json['number'] as int?,
      title: json['title'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Labels.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] as String?,
      locked: json['locked'] as bool?,
      comments: json['comments'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      closedAt: json['closed_at'] as String?,
      authorAssociation: json['author_association'] as String?,
      pullRequest: json['pull_request'] == null
          ? null
          : PullRequest.fromJson(json['pull_request'] as Map<String, dynamic>),
      body: json['body'] as String?,
      reactions: json['reactions'] == null
          ? null
          : Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
      timelineUrl: json['timeline_url'] as String?,
    );

Map<String, dynamic> _$IssuesResultToJson(IssuesResult instance) =>
    <String, dynamic>{
      'url': instance.url,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user,
      'labels': instance.labels,
      'state': instance.state,
      'locked': instance.locked,
      'comments': instance.comments,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'author_association': instance.authorAssociation,
      'pull_request': instance.pullRequest,
      'body': instance.body,
      'reactions': instance.reactions,
      'timeline_url': instance.timelineUrl,
    };
