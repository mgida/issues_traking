import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/repo/issues_repo.dart';

part 'least_recently_updated_issues_state.dart';

class LeastRecentlyUpdatedIssuesCubit
    extends Cubit<LeastRecentlyUpdatedIssuesState> {
  final IssuesRepo userRepo;

  int page = 1;

  LeastRecentlyUpdatedIssuesCubit({required this.userRepo})
      : super(LeastRecentlyUpdatedIssuesInitial());

  void getLeastRecentlyUpdatedIssues(String type) async {
    if (state is LeastRecentlyUpdatedIssuesLoading) return;
    final currentState = state;
    var oldIssues = <IssuesResult>[];
    if (currentState is LeastRecentlyUpdatedIssuesLoaded) {
      oldIssues = currentState.issues;
    }

    emit(LeastRecentlyUpdatedIssuesLoading(oldIssues, isFirstFetch: page == 1));
    try {
      userRepo
          .getLeastRecentlyUpdatedIssues(type, 'updated', 'asc', 30, page)
          .then((newIssues) {
        page++;
        final issues = (state as LeastRecentlyUpdatedIssuesLoading).oldIssues;
        issues.addAll(newIssues.body!);
        emit(LeastRecentlyUpdatedIssuesLoaded(issues: issues));
      });
    } catch (e) {
      LeastRecentlyUpdatedIssuesFailure(errorMsg: e.toString());
    }
  }
}
