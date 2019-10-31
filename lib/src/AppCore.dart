import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/views/main_view.dart';

class AppCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(child: MainView(), textDirection: TextDirection.ltr),
      decoration: BoxDecoration(color: Color.fromRGBO(8, 80, 0, 1)),
    );
  }
}
