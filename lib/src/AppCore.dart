import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class AppCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(child: Center(child: MainView()), color: Color.fromRGBO(0, 64, 0, 1.0)),
      debugShowCheckedModeBanner: false,
    );
  }
}
