import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/repo/issues_repo.dart';

part 'recently_updated_issues_state.dart';

class RecentlyUpdatedIssuesCubit extends Cubit<RecentlyUpdatedIssuesState> {
  final IssuesRepo userRepo;

  int page = 1;

  RecentlyUpdatedIssuesCubit({required this.userRepo})
      : super(RecentlyUpdatedIssuesInitial());

  void getRecentlyUpdatedIssues(String type) async {
    if (state is RecentlyUpdatedIssuesLoading) return;
    final currentState = state;
    var oldIssues = <IssuesResult>[];
    if (currentState is RecentlyUpdatedIssuesLoaded) {
      oldIssues = currentState.issues;
    }

    emit(RecentlyUpdatedIssuesLoading(oldIssues, isFirstFetch: page == 1));
    try {
      userRepo
          .getRecentlyUpdatedIssues(type, 'updated', 'desc', 30, page)
          .then((newIssues) {
        page++;
        final issues = (state as RecentlyUpdatedIssuesLoading).oldIssues;
        issues.addAll(newIssues.body!);

        emit(RecentlyUpdatedIssuesLoaded(issues: issues));
      });
    } catch (e) {
      RecentlyUpdatedIssuesFailure(errorMsg: e.toString());
    }
  }
}
