import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';

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
    return Column(
      children: [
        StreamBuilder(
          stream: _handBloc.handStream,
          builder: (context, snapshot) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _updateCommunityCards(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: StreamBuilder(
            stream: _handBloc.handStream,
            builder: (context, snapshot) => Text(
              _handBloc.currentRound,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        StreamBuilder(
          stream: _handBloc.handStream,
          builder: (context, snapshot) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _updatePlayersSelectedCards(_handBloc.getSelectedPlayerCardsImgPath),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  List<Widget> _updatePlayersSelectedCards(List<CardModel> selectedCardsPath) {
    Widget _playerCardA, _playerCardB;

    if (selectedCardsPath[0] != null)
      _playerCardA = Image.asset("assets/images/${selectedCardsPath[0].suit}_${selectedCardsPath[0].value}.png");
    else
      _playerCardA = _cardPlaceHolder();

    if (selectedCardsPath[1] != null)
      _playerCardB = Image.asset("assets/images/${selectedCardsPath[1].suit}_${selectedCardsPath[1].value}.png");
    else
      _playerCardB = _cardPlaceHolder();

    return [_playerCardA, _playerCardB];
  }

  List<Widget> _updateCommunityCards() {
    Widget communityA, communityB, communityC, communityD, communityE;

    communityA = _cardPlaceHolder();
    communityB = _cardPlaceHolder();
    communityC = _cardPlaceHolder();
    communityD = _cardPlaceHolder();
    communityE = _cardPlaceHolder();

    return [communityA, communityB, communityC, communityD, communityE];
  }

  Widget _cardPlaceHolder() {
    return DragTarget<Card>(
      builder: (context, candidates, rejects) {
        return Container(margin: const EdgeInsets.all(5.0), padding: const EdgeInsets.all(10.0), decoration: BoxDecoration(border: Border.all(width: 2)));
      },
      onAccept: (x) => {},
    );
  }
}
