import 'package:flutter/cupertino.dart';
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
        child: Table(
          children: [
            _getTableRow("Straight Flush", _handBloc.hand.probabilities?.probabilityToStraightFlush),
            _getTableRow("Four of a Kind", _handBloc.hand.probabilities?.probabilityToFourOfAKind),
            _getTableRow("Full House", _handBloc.hand.probabilities?.probabilityToFullHouse),
            _getTableRow("Flush", _handBloc.hand.probabilities?.probabilityToStraightFlush),
            _getTableRow("Straight", _handBloc.hand.probabilities?.probabilityToStraight),
            _getTableRow("Three of a Kind", _handBloc.hand.probabilities?.probabilityToThreeOfAKind),
            _getTableRow("Two Pairs", _handBloc.hand.probabilities?.probabilityToTwoPairs),
            _getTableRow("Pair", _handBloc.hand.probabilities?.probabilityToPair),
            _getTableRow("High Card", _handBloc.hand.probabilities?.probabilityToHighCard)
          ],
          border: TableBorder(
            horizontalInside: BorderSide(width: 0.75, color: Colors.white),
            verticalInside: BorderSide(width: 0.75, color: Colors.white),
            top: BorderSide(width: 0.75, color: Colors.white),
            bottom: BorderSide(width: 0.75, color: Colors.white),
            left: BorderSide(width: 0.75, color: Colors.white),
            right: BorderSide(width: 0.75, color: Colors.white),
          ),
        ));
  }

  TableRow _getTableRow(String title, dynamic value) {
    return TableRow(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        StreamBuilder(
          stream: _handBloc.handStream,
          builder: (context, snapshot) => Text(
            '${(value ?? 0) * 100}%',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
