import 'package:json_annotation/json_annotation.dart';

part 'pull_request.g.dart';


@JsonSerializable()
class PullRequest {
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'diff_url')
  String? diffUrl;
  @JsonKey(name: 'patch_url')
  String? patchUrl;

  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) => _$PullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PullRequestToJson(this);

}
