import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/logic/recently_updated_issues_cubit.dart';

import 'build_issues_list_view.dart';
import 'loading_progress_bar.dart';

class RecentlyUpdatedIssues extends StatelessWidget {
  final ScrollController scrollController;

  const RecentlyUpdatedIssues({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IssuesResult> issues = [];
    bool isLoading = false;

    return BlocBuilder<RecentlyUpdatedIssuesCubit, RecentlyUpdatedIssuesState>(
      builder: (context, state) {
        if (state is RecentlyUpdatedIssuesLoading && state.isFirstFetch) {
          return const LoadingProgressBar(
            color: Colors.black,
          );
        }
        if (state is RecentlyUpdatedIssuesLoading) {
          issues = state.oldIssues;
          isLoading = true;
        } else if (state is RecentlyUpdatedIssuesLoaded) {
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
