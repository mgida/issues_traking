import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/least_recently_updated_issues_cubit.dart';
import 'package:tasks/presentation/components/least_recently_updated_issues.dart';

class LeastRecentlyUpdatedIssuesScreen extends StatefulWidget {
  const LeastRecentlyUpdatedIssuesScreen({Key? key}) : super(key: key);

  @override
  State<LeastRecentlyUpdatedIssuesScreen> createState() =>
      _LeastRecentlyUpdatedIssuesScreenState();
}

class _LeastRecentlyUpdatedIssuesScreenState
    extends State<LeastRecentlyUpdatedIssuesScreen>
    with AutomaticKeepAliveClientMixin<LeastRecentlyUpdatedIssuesScreen> {
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
                return LeastRecentlyUpdatedIssues(
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
          BlocProvider.of<LeastRecentlyUpdatedIssuesCubit>(context)
              .getLeastRecentlyUpdatedIssues('all');
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
