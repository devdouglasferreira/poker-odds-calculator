import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/deck_bloc.dart';

import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';

class CardDeckComponent extends StatelessWidget {
  final HandBloc _handBloc;
  final DeckBloc _deckBloc;

  const CardDeckComponent(this._handBloc, this._deckBloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Column(
          children: <Widget>[
            Row(children: [for (var c in _deckBloc.cardDeck!.where((x) => x.suit == Suit.clubs)) _loadCard(c)]),
            Row(children: [for (var c in _deckBloc.cardDeck!.where((x) => x.suit == Suit.hearts)) _loadCard(c)]),
            Row(children: [for (var c in _deckBloc.cardDeck!.where((x) => x.suit == Suit.spades)) _loadCard(c)]),
            Row(children: [for (var c in _deckBloc.cardDeck!.where((x) => x.suit == Suit.diamonds)) _loadCard(c)])
          ],
        ));
  }

  Widget _loadCard(CardModel c) {
    return Flexible(
      flex: 3,
      child: AspectRatio(
        aspectRatio: 0.66,
        child: StreamBuilder(
          stream: _deckBloc.cardStream,
          builder: (context, x) => Opacity(
            opacity: c.isSelected == true ? 0.3 : 1,
            child: InkWell(
              key: c.key,
              onTap: ()  {
                 _handBloc.selectCardToHand(_deckBloc, _deckBloc.cardDeck!.indexOf((c)));
              },
              child: Image.asset('assets/images/${c.suit}_${c.value}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
