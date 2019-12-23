import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/blocs/HandBloc.dart';
import 'package:poker_odds_calculator/src/view_components/card_deck.dart';
import 'package:poker_odds_calculator/src/view_components/oponent.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  
  HandBloc _handBloc = new HandBloc();
  
  @override
  void initState() {
    super.initState();
    return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        OpponentComponent(_handBloc),
        CardDeckComponent(_handBloc)
        ],
    );
  }
  
}
