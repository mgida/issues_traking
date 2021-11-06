import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/utils/helper_format.dart';

class IssuesDetailScreen extends StatelessWidget {
  final IssuesResult? issue;

  const IssuesDetailScreen(this.issue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DETAIL',
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300.0,
                  child: InkWell(
                    customBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: issue?.user?.avatarUrl ??
                          "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(issue?.title ?? '', style: textTheme.headline6),
                const SizedBox(height: 8.0),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    'user : ${issue?.user?.login}',
                    style: textTheme.bodyText2!.copyWith(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    'created at :  ${HelperFormat.formattedCreatedDate(issue?.createdAt ?? '')}',
                    style: textTheme.bodyText2!.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
