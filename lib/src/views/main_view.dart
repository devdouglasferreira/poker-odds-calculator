import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/components/card_deck.dart';
import 'package:poker_odds_calculator/src/components/game_hand.dart';
import 'package:poker_odds_calculator/src/components/opponents_setup.dart';
import 'package:poker_odds_calculator/src/components/rank_probabilities.dart';

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
            RankProbabilitiesComponent(_handBloc),
            GameHandComponent(_handBloc),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: EdgeInsets.only(left: 15, right: 5),
                  child: StreamBuilder(
                    stream: _handBloc.handStream,
                    builder: (context, snapshot) => Text(
                      '${_handBloc.hand.currentRank ?? ''}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              OpponentSetupComponent(_handBloc),
            ]),
            CardDeckComponent(_handBloc, _cardDeckBloc),
          ],
        ),
      ),
    );
  }
}
