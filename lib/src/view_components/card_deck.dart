import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';

import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';

class CardDeckComponent extends StatefulWidget {
  final HandBloc _handBloc;
  final DeckBloc _deckBloc;

  CardDeckComponent(this._handBloc, this._deckBloc);

  @override
  State<StatefulWidget> createState() {
    return _CardDeckComponentState(_handBloc, _deckBloc);
  }
}

class _CardDeckComponentState extends State<CardDeckComponent> {
  HandBloc _handBloc;
  DeckBloc _deckBloc;

  _CardDeckComponentState(HandBloc handBloc, DeckBloc deckBloc) {
    _handBloc = handBloc;
    _deckBloc = deckBloc;
  }

  @override
  void initState() {
    super.initState();
    return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Column(
          children: <Widget>[
            Row(children: _fillSuitRow(Suit.clubs)),
            Row(children: _fillSuitRow(Suit.diamonds)),
            Row(children: _fillSuitRow(Suit.spades)),
            Row(children: _fillSuitRow(Suit.hearts))
          ],
        ));
  }

  void updateClickedCard(CardModel card) {
    _handBloc.selectCardToHand(card, _deckBloc);
  }

  List<Widget> _fillSuitRow(String suit) {
    List<Widget> suitRow = new List<Widget>();

    for (int i = 2; i < 15; i++) {
      String cardName = '${suit}_${i.toString()}';
      Key key = new Key(cardName);
      CardModel card = new CardModel(i, suit, key);
      _deckBloc.cardDeck.add(card);
      int cardIndex = _deckBloc.cardDeck.indexOf((card));

      suitRow.add(Flexible(
          flex: 3,
          child: AspectRatio(
              aspectRatio: 0.66,
              child: StreamBuilder(
                  stream: _deckBloc.cardStream,
                  builder: (context, x) => Opacity(
                      opacity: _deckBloc.cardDeck[cardIndex].isSelected == true ? 0.3 : 1,
                      child: FlatButton(
                          key: key,
                          onPressed: () => updateClickedCard(_deckBloc.cardDeck[cardIndex]),
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset('assets/images/$cardName.png')))))));
    }
    return suitRow;
  }
}
