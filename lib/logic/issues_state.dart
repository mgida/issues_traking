part of 'issues_cubit.dart';

@immutable
abstract class IssuesState {}

class IssuesInitial extends IssuesState {}

class AllIssuesLoading extends IssuesState {
  final List<IssuesResult> oldIssues;
  final bool isFirstFetch;

  AllIssuesLoading(this.oldIssues, {this.isFirstFetch = false});
}

class AllIssuesFailure extends IssuesState {
  final String errorMsg;

  AllIssuesFailure({required this.errorMsg});
}

class AllIssuesLoaded extends IssuesState {
  final List<IssuesResult> issues;

  AllIssuesLoaded({required this.issues});
}
