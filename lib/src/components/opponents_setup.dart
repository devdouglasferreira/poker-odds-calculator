import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class OpponentSetupComponent extends StatelessWidget {
  final HandBloc _handBloc;

  OpponentSetupComponent(this._handBloc);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            const Text('Opponents', style: TextStyle(color: Colors.white, fontSize: 18)),
            StreamBuilder(
              stream: _handBloc.handStream,
              builder: (context, snapshot) => Text(
                '${_handBloc.hand.numberOfOponents}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFFA65F08)),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: const Icon(Icons.arrow_upward),
                onPressed: () => _handBloc.addOpponent(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFFA65F08)),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: const Icon(Icons.arrow_downward),
                onPressed: () => _handBloc.removeOpponent(),
              ),
            )
          ],
        )
      ],
    );
  }
}
