import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/issues_cubit.dart';
import 'package:tasks/logic/theme_cubit.dart';
import 'package:tasks/presentation/components/issues.dart';

class IssuesScreen extends StatelessWidget {
  final scrollController = ScrollController();

  IssuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<IssuesCubit>(context).getAllIssues('all');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Github Issues',
        ),
        actions: [
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {},
                icon: SwitchListTile(
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context)
                        .toggleTheme(value: value);
                  },
                  value: state,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
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
      ),
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
}
