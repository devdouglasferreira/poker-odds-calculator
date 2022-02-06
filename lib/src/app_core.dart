import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class ApplicationCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Odds Calculator',
      home: MainView(),
    );
  }
}
