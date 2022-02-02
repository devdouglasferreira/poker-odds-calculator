import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class OpponentSetupComponent extends StatefulWidget {
  final HandBloc _handBloc;

  OpponentSetupComponent(this._handBloc);

  @override
  State<StatefulWidget> createState() {
    return OpponentSetupComponentState(_handBloc);
  }
}

class OpponentSetupComponentState extends State<OpponentSetupComponent> {
  HandBloc _handBloc;

  OpponentSetupComponentState(HandBloc handBloc) {
    this._handBloc = handBloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Opponents', style: TextStyle(color: Colors.white, fontSize: 18)),
            StreamBuilder(
              stream: _handBloc.handStream,
              builder: (context, snapshot) => Text(
                '${_handBloc.hand.numberOfOponents}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange.shade700),
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                child: Icon(Icons.arrow_upward),
                onPressed: () => _handBloc.addOpponent(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange.shade700),
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                child: Icon(Icons.arrow_downward),
                onPressed: () => _handBloc.removeOpponent(),
              ),
            )
          ],
        )
      ],
    ));
  }
}
