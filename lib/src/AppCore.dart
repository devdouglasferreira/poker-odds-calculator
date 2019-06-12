import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class AppCore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MainView()
      )
    );
  }
}