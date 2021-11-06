import 'package:flutter/material.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/presentation/components/loading_progress_bar.dart';

import 'build_issues_list_view_item.dart';

class BuildIssuesListView extends StatelessWidget {
  final List<IssuesResult> issues;
  final ScrollController scrollController;
  final bool isLoading;

  const BuildIssuesListView(
      {required this.issues,
      required this.scrollController,
      required this.isLoading,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < issues.length) {
          return BuildIssuesListViewItem(issues[index], context);
        } else {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
          return const LoadingProgressBar(
            color: Colors.red,
          );
        }
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        );
      },
      itemCount: issues.length + (isLoading ? 1 : 0),
    );
  }
}
