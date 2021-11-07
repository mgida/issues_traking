import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/recently_updated_issues_cubit.dart';
import 'package:tasks/presentation/components/recently_updated_issues.dart';

class RecentlyUpdatedIssuesScreen extends StatefulWidget {
  const RecentlyUpdatedIssuesScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyUpdatedIssuesScreen> createState() =>
      _RecentlyUpdatedIssuesScreenState();
}

class _RecentlyUpdatedIssuesScreenState
    extends State<RecentlyUpdatedIssuesScreen>
    with AutomaticKeepAliveClientMixin<RecentlyUpdatedIssuesScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetDisconnected) {
                return const Center(
                  child: Text(
                    'Check Your Connection',
                  ),
                );
              } else {
                return RecentlyUpdatedIssues(
                  scrollController: scrollController,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<RecentlyUpdatedIssuesCubit>(context)
              .getRecentlyUpdatedIssues('all');
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
