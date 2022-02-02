import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';

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
            children: _updateCommunityCards(_handBloc.selectedComunityCards),
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
            children: _updatePlayersSelectedCards(_handBloc.selectedPlayerCards),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  List<Widget> _updatePlayersSelectedCards(List<CardModel> selectedCards) {
    List<Widget> playerCards = [_cardPlaceHolder(), _cardPlaceHolder()];
    return _fillSelectedCards(selectedCards, playerCards);
  }

  List<Widget> _updateCommunityCards(List<CardModel> selectedCards) {
    List<Widget> comunityCards = [_cardPlaceHolder(), _cardPlaceHolder(), _cardPlaceHolder(), _cardPlaceHolder(), _cardPlaceHolder()];
    return _fillSelectedCards(selectedCards, comunityCards);
  }

  List<Widget> _fillSelectedCards(List<CardModel> selectedCards, List<Widget> widgetTemplate) {
    for (int i = 0; i < selectedCards.length; i++) {
      widgetTemplate[i] = Image.asset("assets/images/${selectedCards[i].suit}_${selectedCards[i].value}.png");
    }
    return widgetTemplate;
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
