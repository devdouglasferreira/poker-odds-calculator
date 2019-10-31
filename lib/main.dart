import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker_odds_calculator/src/AppCore.dart';

void main() {
  runApp(AppCore());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
