import 'package:chopper/chopper.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/rest/issues_service.dart';

class IssuesRepo {
  final IssuesService issuesService;

  IssuesRepo({required this.issuesService});

  Future<Response<List<IssuesResult>>> getAllIssues(
      String state, int perPage, int page) async {
    return await issuesService.getAllIssues(state, perPage, page);
  }
}
