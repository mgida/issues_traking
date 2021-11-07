part of 'recently_updated_issues_cubit.dart';

@immutable
abstract class RecentlyUpdatedIssuesState {}

class RecentlyUpdatedIssuesInitial extends RecentlyUpdatedIssuesState {}

class RecentlyUpdatedIssuesLoading extends RecentlyUpdatedIssuesState {
  final List<IssuesResult> oldIssues;
  final bool isFirstFetch;

  RecentlyUpdatedIssuesLoading(this.oldIssues, {this.isFirstFetch = false});
}

class RecentlyUpdatedIssuesFailure extends RecentlyUpdatedIssuesState {
  final String errorMsg;

  RecentlyUpdatedIssuesFailure({required this.errorMsg});
}

class RecentlyUpdatedIssuesLoaded extends RecentlyUpdatedIssuesState {
  final List<IssuesResult> issues;

  RecentlyUpdatedIssuesLoaded({required this.issues});
}
