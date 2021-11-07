import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/old_issues_cubit.dart';
import 'package:tasks/presentation/components/oldest_issues.dart';

class OldestIssuesScreen extends StatefulWidget {
  const OldestIssuesScreen({Key? key}) : super(key: key);

  @override
  State<OldestIssuesScreen> createState() => _OldestIssuesScreenState();
}

class _OldestIssuesScreenState extends State<OldestIssuesScreen>
    with AutomaticKeepAliveClientMixin<OldestIssuesScreen> {
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
                return OldestIssues(
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
          BlocProvider.of<OldIssuesCubit>(context).getOldestIssues('all');
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
