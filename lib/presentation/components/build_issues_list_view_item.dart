import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/presentation/screens/issues_detail_screen.dart';
import 'package:tasks/utils/helper_format.dart';

class BuildIssuesListViewItem extends StatelessWidget {
  final IssuesResult? issue;
  final BuildContext context;

  const BuildIssuesListViewItem(this.issue, this.context, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        navigateToDetailScreen(context, issue!);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${issue?.title}',
              style: textTheme.headline6,
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    HelperFormat.formattedCreatedDate(issue?.createdAt ?? '') ??
                        '',
                    style: textTheme.bodyText2,
                  ),
                ),
                Text(
                  issue!.state!,
                  style: textTheme.bodyText2!.copyWith(
                      color:
                          issue!.state! == 'open' ? Colors.red : Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailScreen(BuildContext context, IssuesResult issue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IssuesDetailScreen(issue),
      ),
    );
  }
}
