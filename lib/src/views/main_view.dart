import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/deck_bloc.dart';
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
  HandBloc _handBloc;
  DeckBloc _cardDeckBloc;
  Random r = Random();

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    _handBloc = HandBloc();
    _cardDeckBloc = DeckBloc();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF005913)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RankProbabilitiesComponent(_handBloc),
                StreamBuilder(
                  stream: _handBloc.handStream,
                  builder: ((context, snapshot) => isComputing(_handBloc.hand.computing)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GameHandComponent(_handBloc),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFA65F08)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Icon(Icons.restart_alt),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    ),
                  ),
                  OpponentSetupComponent(_handBloc),
                ]),
                CardDeckComponent(_handBloc, _cardDeckBloc),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget isComputing(bool computing) {
    if (computing) {
      return const Padding(
        child: CircularProgressIndicator(),
        padding: EdgeInsets.only(bottom: 10),
      );
    }
    return Container();
  }
}
