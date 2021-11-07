part of 'least_recently_updated_issues_cubit.dart';

@immutable
abstract class LeastRecentlyUpdatedIssuesState {}

class LeastRecentlyUpdatedIssuesInitial
    extends LeastRecentlyUpdatedIssuesState {}

class LeastRecentlyUpdatedIssuesLoading
    extends LeastRecentlyUpdatedIssuesState {
  final List<IssuesResult> oldIssues;
  final bool isFirstFetch;

  LeastRecentlyUpdatedIssuesLoading(this.oldIssues,
      {this.isFirstFetch = false});
}

class LeastRecentlyUpdatedIssuesFailure
    extends LeastRecentlyUpdatedIssuesState {
  final String errorMsg;

  LeastRecentlyUpdatedIssuesFailure({required this.errorMsg});
}

class LeastRecentlyUpdatedIssuesLoaded extends LeastRecentlyUpdatedIssuesState {
  final List<IssuesResult> issues;

  LeastRecentlyUpdatedIssuesLoaded({required this.issues});
}
