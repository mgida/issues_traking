import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/data/rest/issues_service.dart';
import 'package:tasks/logic/internet_cubit.dart';
import 'package:tasks/logic/issues_cubit.dart';
import 'package:tasks/logic/least_recently_updated_issues_cubit.dart';
import 'package:tasks/logic/old_issues_cubit.dart';
import 'package:tasks/logic/recently_updated_issues_cubit.dart';
import 'package:tasks/logic/theme_cubit.dart';
import 'package:tasks/presentation/screens/issues_screen.dart';
import 'package:tasks/utils/constants.dart';

import 'data/repo/issues_repo.dart';

void main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    log('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IssuesRepo _issuesRepo = IssuesRepo(
      issuesService: IssuesService.create(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              IssuesCubit(userRepo: _issuesRepo)..getAllIssues('all'),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              OldIssuesCubit(userRepo: _issuesRepo)..getOldestIssues('all'),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RecentlyUpdatedIssuesCubit(userRepo: _issuesRepo)
                ..getRecentlyUpdatedIssues('all'),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LeastRecentlyUpdatedIssuesCubit(userRepo: _issuesRepo)
                ..getLeastRecentlyUpdatedIssues('all'),
        ),
        BlocProvider(
          create: (BuildContext context) => InternetCubit(
            connectivity: Connectivity(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryTextTheme: TextTheme(
                  headline6: kNewsCycleFont,
                ),
                textTheme: kTextTheme),
            darkTheme: ThemeData.dark().copyWith(
              primaryTextTheme: TextTheme(
                headline6: kNewsCycleFont,
              ),
              tabBarTheme: const TabBarTheme(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70),
            ),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const IssuesScreen(),
          );
        },
      ),
    );
  }
}
