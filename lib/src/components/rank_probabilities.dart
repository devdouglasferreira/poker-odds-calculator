import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class RankProbabilitiesComponent extends StatefulWidget {
  final HandBloc _handBloc;
  RankProbabilitiesComponent(this._handBloc);

  @override
  _RankProbabilitiesComponentState createState() => _RankProbabilitiesComponentState(_handBloc);
}

class _RankProbabilitiesComponentState extends State<RankProbabilitiesComponent> {
  final HandBloc _handBloc;
  _RankProbabilitiesComponentState(this._handBloc);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 40, left: 10, right: 10),
        child: StreamBuilder(
          stream: _handBloc.probabilityStream,
          builder: (context, snapshot) => Table(
            children: [
              _getTableRow("Straight Flush", _handBloc.probability?.probabilityToStraightFlush),
              _getTableRow("Four of a Kind", _handBloc.probability?.probabilityToFourOfAKind),
              _getTableRow("Full House", _handBloc.probability?.probabilityToFullHouse),
              _getTableRow("Flush", _handBloc.probability?.probabilityToFlush),
              _getTableRow("Straight", _handBloc.probability?.probabilityToStraight),
              _getTableRow("Three of a Kind", _handBloc.probability?.probabilityToThreeOfAKind),
              _getTableRow("Two Pairs", _handBloc.probability?.probabilityToTwoPairs),
              _getTableRow("Pair", _handBloc.probability?.probabilityToPair),
              _getTableRow("High Card", _handBloc.probability?.probabilityToHighCard)
            ],
            border: TableBorder(
              horizontalInside: BorderSide(width: 0.75, color: Colors.white),
              verticalInside: BorderSide(width: 0.75, color: Colors.white),
              top: BorderSide(width: 0.75, color: Colors.white),
              bottom: BorderSide(width: 0.75, color: Colors.white),
              left: BorderSide(width: 0.75, color: Colors.white),
              right: BorderSide(width: 0.75, color: Colors.white),
            ),
          ),
        ));
  }

  TableRow _getTableRow(String title, double value) {
    return TableRow(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '${((value ?? 0) * 100).toStringAsFixed(2)}%',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
