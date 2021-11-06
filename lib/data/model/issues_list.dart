import 'package:json_annotation/json_annotation.dart';
import 'package:tasks/data/model/issues_result.dart';

@JsonSerializable()
class IssuesList {
  List<IssuesResult>? issues;

  IssuesList({required this.issues});

  factory IssuesList.fromJson(List<dynamic> json) {
    return IssuesList(
        issues: json
            .map((e) => IssuesResult.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
