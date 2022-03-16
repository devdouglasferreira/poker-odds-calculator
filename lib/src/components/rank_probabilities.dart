import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class RankProbabilitiesComponent extends StatelessWidget {
  final HandBloc _handBloc;
  RankProbabilitiesComponent(this._handBloc);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 40),
        child: StreamBuilder(
            stream: _handBloc.handStream,
            builder: (context, snapshot) => Opacity(
                  opacity: _handBloc.hand.computing ? 0.5 : 1,
                  child: Column(
                    children: [
                      Table(children: [
                        _getTableRow("Straight Flush", _handBloc.hand.probability.probabilityToStraightFlush),
                        _getTableRow("Four of a Kind", _handBloc.hand.probability.probabilityToFourOfAKind),
                        _getTableRow("Full House", _handBloc.hand.probability.probabilityToFullHouse),
                        _getTableRow("Flush", _handBloc.hand.probability.probabilityToFlush),
                        _getTableRow("Straight", _handBloc.hand.probability.probabilityToStraight),
                        _getTableRow("Three of a Kind", _handBloc.hand.probability.probabilityToThreeOfAKind),
                        _getTableRow("Two Pairs", _handBloc.hand.probability.probabilityToTwoPairs),
                        _getTableRow("Pair", _handBloc.hand.probability.probabilityToPair),
                        _getTableRow("High Card", _handBloc.hand.probability.probabilityToHighCard)
                      ], border: _getTableBorder()),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Table(children: [
                          _getTableRow("Win", _handBloc.hand.probability.winProbability),
                          _getTableRow("Tie", _handBloc.hand.probability.tieProbability),
                        ], border: _getTableBorder()),
                      )
                    ],
                  ),
                )));
  }

  TableRow _getTableRow(String title, double? value) {
    return TableRow(
      children: [
        Padding(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          padding: const EdgeInsets.only(left: 5, top: 2, bottom: 2),
        ),
        Padding(
            child: Text(
              '${((value ?? 0) * 100.0).toStringAsFixed(3)}%',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.only(bottom: 2, top: 2)),
      ],
    );
  }

  TableBorder _getTableBorder() {
    return const TableBorder(
      horizontalInside: BorderSide(width: 0.75, color: Colors.white),
      verticalInside: BorderSide(width: 0.75, color: Colors.white),
      top: BorderSide(width: 0.75, color: Colors.white),
      bottom: BorderSide(width: 0.75, color: Colors.white),
      left: BorderSide(width: 0.75, color: Colors.white),
      right: BorderSide(width: 0.75, color: Colors.white),
    );
  }
}
