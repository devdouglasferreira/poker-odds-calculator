import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';

class GameHandComponent extends StatefulWidget {
  final HandBloc _handBloc;

  GameHandComponent(this._handBloc);

  @override
  State<StatefulWidget> createState() {
    return GameHandComponentState(_handBloc);
  }
}

class GameHandComponentState extends State<GameHandComponent> {
  HandBloc _handBloc;

  GameHandComponentState(this._handBloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: _handBloc.handStream,
          builder: (context, snapshot) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _updatePlayersSelectedCards(_handBloc.getSelectedPlayerCardsImgPath),
              )),
    );
  }

  List<Widget> _updatePlayersSelectedCards(List<String> selectedCardsPath) {
    Widget _playerCardA, _playerCardB;

    if (selectedCardsPath[0] != null)
      _playerCardA = Image.asset(selectedCardsPath[0]);
    else
      _playerCardA = _cardPlaceHolder();

    if (selectedCardsPath[1] != null)
      _playerCardB = Image.asset(selectedCardsPath[1]);
    else
      _playerCardB = _cardPlaceHolder();

    return [_playerCardA, _playerCardB];
  }

  Widget _cardPlaceHolder() {
    return IconButton(icon: Icon(Icons.error), onPressed: () => {});
  }
}
