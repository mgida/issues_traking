import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kNewsCycleFont = GoogleFonts.newsCycle(fontWeight: FontWeight.w700);

final kTextTheme = TextTheme(
  subtitle1: kNewsCycleFont.apply(color: Colors.black),
  headline6: kNewsCycleFont.apply(color: Colors.black),
  bodyText2: const TextStyle(color: Colors.black),
);
