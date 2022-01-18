import 'package:flutter/material.dart';
import 'package:weatheureka/screens/loading_screen.dart';
import 'package:weatheureka/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: LoadingScreen(),
    );
  }
}
