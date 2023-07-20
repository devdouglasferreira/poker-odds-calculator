import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class ApplicationCore extends StatelessWidget {
  const ApplicationCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Odds Calculator',
      home: const SafeArea(child: MainView()),
      theme: ThemeData(fontFamily: "Casino"),
      debugShowCheckedModeBanner: false,
    );
  }
}
