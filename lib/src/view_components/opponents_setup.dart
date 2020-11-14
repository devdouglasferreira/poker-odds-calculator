import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class OpponentSetupComponent extends StatefulWidget {
  HandBloc _handBloc;

  OpponentSetupComponent(HandBloc handBloc) {
    this._handBloc = handBloc;
  }

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
            Text('Number of Opponents', style: TextStyle(color: Colors.white)),
            StreamBuilder(
                stream: _handBloc.handStream,
                builder: (context, snapshot) => Text('${_handBloc.hand.numberOfOponents}', style: TextStyle(color: Colors.white)))
          ],
        ),
        Column(
          children: <Widget>[
            IconButton(
                alignment: Alignment.bottomCenter,
                icon: Icon(Icons.arrow_drop_up),
                color: Colors.white,
                onPressed: () => _handBloc.addOpponent()),
            IconButton(icon: Icon(Icons.arrow_drop_down), color: Colors.white, onPressed: () => _handBloc.removeOpponent())
          ],
        )
      ],
    ));
  }
}
