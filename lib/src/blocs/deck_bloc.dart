import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:poker_odds_calculator/src/models/helpers/mappers.dart';

import '../models/card_model.dart';

class DeckBloc {
  final StreamController<UnmodifiableListView<CardModel>> _cardState = StreamController<UnmodifiableListView<CardModel>>.broadcast();

  UnmodifiableListView<CardModel>? cardDeck;

  DeckBloc() {
    var deck = <CardModel>[];

    for (int i = 0; i <= 3; i++) {
      for (int j = 2; j <= 14; j++) {
        String cardName = '${Mappers.mapSuit(i)}_${j.toString()}';
        Key key = Key(cardName);
        CardModel card = CardModel(j, Mappers.mapSuit(i), key);
        deck.add(card);
      }
    }
    cardDeck = UnmodifiableListView(deck);
  }

  StreamSink<UnmodifiableListView<CardModel>?> get cardSink => _cardState.sink;
  Stream<UnmodifiableListView<CardModel>> get cardStream => _cardState.stream;

  void addToDeck(CardModel card) {
    cardDeck?.add(card);
  }

  void selectCard(CardModel card) {
    cardDeck?[cardDeck!.indexOf(card)].isSelected = true;
    cardSink.add(cardDeck);
  }

  void unSelectCard(CardModel card) {
    cardDeck?[cardDeck!.indexOf(card)].isSelected = false;
    cardSink.add(cardDeck);
  }

  void close() {
    _cardState.close();
  }
}
