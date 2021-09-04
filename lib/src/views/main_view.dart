import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/view_components/card_deck.dart';
import 'package:poker_odds_calculator/src/view_components/game_hand.dart';
import 'package:poker_odds_calculator/src/view_components/opponents_setup.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  HandBloc _handBloc = new HandBloc();
  DeckBloc _cardDeckBloc = new DeckBloc();

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
    return Material(
      color: Color.fromRGBO(8, 80, 0, 1),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GameHandComponent(_handBloc),
            OpponentSetupComponent(_handBloc),
            CardDeckComponent(_handBloc, _cardDeckBloc),
          ],
        ),
      ),
    );
  }
}
