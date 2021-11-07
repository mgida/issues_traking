import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/repo/issues_repo.dart';

part 'old_issues_state.dart';

class OldIssuesCubit extends Cubit<OldIssuesState> {
  final IssuesRepo userRepo;

  int page = 1;

  OldIssuesCubit({required this.userRepo}) : super(OldIssuesInitial());

  void getOldestIssues(String type) async {
    if (state is OldestIssuesLoading) return;
    final currentState = state;
    var oldIssues = <IssuesResult>[];
    if (currentState is OldestIssuesLoaded) {
      oldIssues = currentState.issues;
    }

    emit(OldestIssuesLoading(oldIssues, isFirstFetch: page == 1));
    try {
      userRepo.getOldestIssues(type, 'asc', 30, page).then((newIssues) {
        page++;
        final issues = (state as OldestIssuesLoading).oldIssues;
        issues.addAll(newIssues.body!);
        emit(OldestIssuesLoaded(issues: issues));
      });
    } catch (e) {
      OldestIssuesFailure(errorMsg: e.toString());
    }
  }
}
