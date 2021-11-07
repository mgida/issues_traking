import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/issues_cubit.dart';
import 'package:tasks/presentation/components/issues.dart';

class NewestIssuesScreen extends StatefulWidget {
  const NewestIssuesScreen({Key? key}) : super(key: key);

  @override
  State<NewestIssuesScreen> createState() => _NewestIssuesScreenState();
}

class _NewestIssuesScreenState extends State<NewestIssuesScreen>
    with AutomaticKeepAliveClientMixin<NewestIssuesScreen> {
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
                return Issues(
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
          BlocProvider.of<IssuesCubit>(context).getAllIssues('all');
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
