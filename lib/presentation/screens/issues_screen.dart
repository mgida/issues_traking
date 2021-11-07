import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/theme_cubit.dart';
import 'package:tasks/presentation/screens/newest_issues_screen.dart';
import 'package:tasks/presentation/screens/oldest_issues_screen.dart';
import 'package:tasks/presentation/screens/recently_updated_issues_screen.dart';

import 'least_recently_updated_issues_screen.dart';

class IssuesScreen extends StatelessWidget {
  const IssuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: const TabBar(
            unselectedLabelColor: Colors.white70,
            tabs: [
              Text('Newest'),
              Text('Oldest'),
              Text('Recently Updated'),
              Text('Least Updated'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          NewestIssuesScreen(),
          OldestIssuesScreen(),
          RecentlyUpdatedIssuesScreen(),
          LeastRecentlyUpdatedIssuesScreen(),
        ]),
      ),
    );
  }
}
