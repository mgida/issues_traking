import 'package:flutter/material.dart';

class LoadingProgressBar extends StatelessWidget {
  final Color? color;

  const LoadingProgressBar({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
