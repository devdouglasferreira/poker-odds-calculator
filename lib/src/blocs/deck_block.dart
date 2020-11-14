import 'dart:async';

import '../models/CardModel.dart';

class DeckBloc {
  final StreamController<List<CardModel>> _cardState =
      StreamController<List<CardModel>>.broadcast();

  List<CardModel> cardDeck;

  DeckBloc() {
    cardDeck = new List<CardModel>();
  }

  StreamSink<List<CardModel>> get cardSink => _cardState.sink;
  Stream<List<CardModel>> get cardStream => _cardState.stream;

  void addToDeck(CardModel card) {
    cardDeck.add(card);
  }

  void selectCard(CardModel card) {
    cardDeck[cardDeck.indexOf(card)].isSelected = true;
    cardSink.add(cardDeck);
  }

  void unSelectCard(CardModel card) {
    cardDeck[cardDeck.indexOf(card)].isSelected = false;
    cardSink.add(cardDeck);
  }

  void close() {
    _cardState.close();
  }
}
