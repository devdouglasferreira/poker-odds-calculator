import 'dart:async';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';
import 'package:poker_odds_calculator/src/models/HandModel.dart';

class HandBloc {
  HandModel hand;

  HandBloc() {
    hand = new HandModel();
  }

  final StreamController<HandModel> _handStateController = StreamController<HandModel>.broadcast();

  StreamSink<HandModel> get handSink => _handStateController.sink;
  Stream<HandModel> get handStream => _handStateController.stream;

  void selectCardToHand(CardModel card, DeckBloc deck) {
    if (hand.currentHand.length < 2 && card.isSelected == false) {
      card.isSelected = true;
      hand.currentHand.add(card);
      deck.selectCard(card);
    } else if (card.isSelected == true) {
      card.isSelected = false;
      if (hand.communityCards.contains(card)) {
        hand.communityCards.remove(card);
        deck.unSelectCard(card);
      } else if (hand.currentHand.contains(card)) {
        hand.currentHand.remove(card);
        deck.unSelectCard(card);
      }
    } else if (hand.communityCards.length < 5) {
      hand.communityCards.add(card);
      deck.selectCard(card);
    }

    handSink.add(hand);
  }

  void addOpponent() {
    hand.numberOfOponents++;
    handSink.add(hand);
  }

  void removeOpponent() {
    if (hand.numberOfOponents > 0) hand.numberOfOponents--;
    handSink.add(hand);
  }

  void close() {
    _handStateController.close();
  }
}
