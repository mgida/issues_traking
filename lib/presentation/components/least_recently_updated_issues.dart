import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/logic/least_recently_updated_issues_cubit.dart';

import 'build_issues_list_view.dart';
import 'loading_progress_bar.dart';

class LeastRecentlyUpdatedIssues extends StatelessWidget {
  final ScrollController scrollController;

  const LeastRecentlyUpdatedIssues({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IssuesResult> issues = [];
    bool isLoading = false;

    return BlocBuilder<LeastRecentlyUpdatedIssuesCubit,
        LeastRecentlyUpdatedIssuesState>(
      builder: (context, state) {
        if (state is LeastRecentlyUpdatedIssuesLoading && state.isFirstFetch) {
          return const LoadingProgressBar(
            color: Colors.black,
          );
        }
        if (state is LeastRecentlyUpdatedIssuesLoading) {
          issues = state.oldIssues;
          isLoading = true;
        } else if (state is LeastRecentlyUpdatedIssuesLoaded) {
          issues = state.issues;
        }
        return BuildIssuesListView(
          issues: issues,
          scrollController: scrollController,
          isLoading: isLoading,
        );
      },
    );
  }
}
