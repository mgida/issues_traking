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

  Future<Response<List<IssuesResult>>> getOldestIssues(
      String state, String direction, int perPage, int page) async {
    return await issuesService.getOldestIssues(state, direction, perPage, page);
  }

  Future<Response<List<IssuesResult>>> getRecentlyUpdatedIssues(String state,
      String sort, String direction, int perPage, int page) async {
    return await issuesService.getRecentlyUpdatedIssues(
        state, sort, direction, perPage, page);
  }

  Future<Response<List<IssuesResult>>> getLeastRecentlyUpdatedIssues(
      String state,
      String sort,
      String direction,
      int perPage,
      int page) async {
    return await issuesService.getLeastRecentlyUpdatedIssues(
        state, sort, direction, perPage, page);
  }
}
