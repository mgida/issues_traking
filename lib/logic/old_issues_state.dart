part of 'old_issues_cubit.dart';

@immutable
abstract class OldIssuesState {}

class OldIssuesInitial extends OldIssuesState {}

class OldestIssuesLoading extends OldIssuesState {
  final List<IssuesResult> oldIssues;
  final bool isFirstFetch;

  OldestIssuesLoading(this.oldIssues, {this.isFirstFetch = false});
}

class OldestIssuesFailure extends OldIssuesState {
  final String errorMsg;

  OldestIssuesFailure({required this.errorMsg});
}

class OldestIssuesLoaded extends OldIssuesState {
  final List<IssuesResult> issues;

  OldestIssuesLoaded({required this.issues});
}
