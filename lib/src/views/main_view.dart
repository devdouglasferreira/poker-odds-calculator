import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/deck_bloc.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/components/card_deck.dart';
import 'package:poker_odds_calculator/src/components/game_hand.dart';
import 'package:poker_odds_calculator/src/components/opponents_setup.dart';
import 'package:poker_odds_calculator/src/components/rank_probabilities.dart';

import '../models/hand_model.dart';

class MainViewArgs {
  int lastOpponentNumbers = 1;
  MainViewArgs(this.lastOpponentNumbers);
}

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  Random r = Random();
  MainViewArgs? args;

  @override
  Widget build(BuildContext context) {
    HandBloc _handBloc = HandBloc(HandModel());
    DeckBloc _cardDeckBloc = DeckBloc();

    if (ModalRoute.of(context)?.settings.arguments != null) {
      args = ModalRoute.of(context)?.settings.arguments as MainViewArgs;
      _handBloc.hand.numberOfOponents = args!.lastOpponentNumbers;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF005913)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
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
                      onPressed: () => Navigator.pushReplacementNamed(context, '/', arguments: MainViewArgs(_handBloc.hand.numberOfOponents)),
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
      return const CircularProgressIndicator(color: Color(0xFFA65F08), strokeWidth: 5, backgroundColor: Color(0xFF593509));
    }
    return Container();
  }
}
