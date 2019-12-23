import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';

class CardDeckComponent extends StatefulWidget {
  HandBloc _handBloc;
  CardDeckComponent(HandBloc handBloc) {
    this._handBloc = handBloc;
  }
  @override
  State<StatefulWidget> createState() {
    return CardDeckComponentState(_handBloc);
  }
}

class CardDeckComponentState extends State<CardDeckComponent> {
  HandBloc _handBloc;

  CardDeckComponentState(HandBloc handBloc) {
    this._handBloc = handBloc;
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
      children: <Widget>[Row(children: _fillSuitRow(Suit.clubs)), Row(children: _fillSuitRow(Suit.diamonds)), Row(children: _fillSuitRow(Suit.spades)), Row(children: _fillSuitRow(Suit.hearts))],
    ));
  }

  List<Widget> _fillSuitRow(String suit) {
    List<Widget> suitRow = new List<Widget>();

    for (int i = 2; i < 15; i++) {
      String cardName = '${suit}_${i.toString()}';
      Key key = new Key(cardName);
      CardModel card = new CardModel(i, suit, key);
      suitRow.add(Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: FlatButton(key: key, onPressed: () => _handBloc.selectCard(card), padding: EdgeInsets.all(0.0), child: Image.asset('assets/images/$cardName.png')))));
    }
    return suitRow;
  }
}
