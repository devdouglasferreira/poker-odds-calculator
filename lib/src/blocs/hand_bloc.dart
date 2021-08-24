import 'dart:async';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';
import 'package:poker_odds_calculator/src/models/HandModel.dart';

class HandBloc {
  String _playerCardA, _playerCardB;

  HandModel hand;

  HandBloc() {
    hand = new HandModel();
  }

  final StreamController<HandModel> _handStateController = StreamController<HandModel>.broadcast();

  StreamSink<HandModel> get handSink => _handStateController.sink;
  Stream<HandModel> get handStream => _handStateController.stream;
  List<String> get getSelectedPlayerCardsImgPath => [_playerCardA, _playerCardB];

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
    _updatePlayerHandCard();
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

  void _updatePlayerHandCard() {
    if (hand.currentHand.length == 1) {
      _playerCardA = "assets/images/${hand.currentHand[0].suit}_${hand.currentHand[0].value.toString()}.png";
      _playerCardB = null;
    } else if (hand.currentHand.length == 2) {
      _playerCardA = "assets/images/${hand.currentHand[0].suit}_${hand.currentHand[0].value.toString()}.png";
      _playerCardB = "assets/images/${hand.currentHand[1].suit}_${hand.currentHand[1].value.toString()}.png";
    } else {
      _playerCardA = null;
      _playerCardB = null;
    }
  }
}
