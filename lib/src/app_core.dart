import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class ApplicationCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(color: Colors.black, title: 'Poker Odds Calculator', builder: (context, child) => MainView());
  }
}
