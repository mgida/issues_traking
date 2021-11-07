import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/repo/issues_repo.dart';

part 'issues_state.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final IssuesRepo userRepo;

  int page = 1;

  IssuesCubit({required this.userRepo}) : super(IssuesInitial());

  void getAllIssues(String type) async {
    if (state is AllIssuesLoading) return;
    final currentState = state;
    var oldIssues = <IssuesResult>[];
    if (currentState is AllIssuesLoaded) {
      oldIssues = currentState.issues;
    }

    emit(AllIssuesLoading(oldIssues, isFirstFetch: page == 1));
    try {
      userRepo.getAllIssues(type, 30, page).then((newIssues) {
        page++;
        final issues = (state as AllIssuesLoading).oldIssues;
        issues.addAll(newIssues.body!);
        emit(AllIssuesLoaded(issues: issues));
      });
    } catch (e) {
      AllIssuesFailure(errorMsg: e.toString());
    }
  }
}
