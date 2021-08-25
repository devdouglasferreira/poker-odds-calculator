import 'dart:async';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/models/CardModel.dart';
import 'package:poker_odds_calculator/src/models/HandModel.dart';
import 'package:poker_odds_calculator/src/models/round.dart';

class HandBloc {
  CardModel _playerCardA, _playerCardB;
  HandModel hand;
  String currentRound = Rounds.preflop;

  HandBloc() {
    hand = new HandModel();
  }

  final StreamController<HandModel> _handStateController = StreamController<HandModel>.broadcast();

  StreamSink<HandModel> get handSink => _handStateController.sink;
  Stream<HandModel> get handStream => _handStateController.stream;
  List<CardModel> get getSelectedPlayerCardsImgPath => [_playerCardA, _playerCardB];

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
    _updateCurrentRound();
  }

  void addOpponent() {
    if (hand.numberOfOponents < 9) {
      hand.numberOfOponents++;
      handSink.add(hand);
    }
  }

  void removeOpponent() {
    if (hand.numberOfOponents > 0) hand.numberOfOponents--;
    handSink.add(hand);
  }

  void close() {
    _handStateController.close();
  }

  void _updateCurrentRound() {
    if (hand.communityCards.length < 1)
      currentRound = Rounds.preflop;
    else if (hand.communityCards.length < 4)
      currentRound = Rounds.flop;
    else if (hand.communityCards.length < 4)
      currentRound = Rounds.flop;
    else if (hand.communityCards.length < 5)
      currentRound = Rounds.river;
    else
      currentRound = Rounds.turn;
  }

  void _updatePlayerHandCard() {
    if (hand.currentHand.length == 1) {
      _playerCardA = hand.currentHand[0];
      _playerCardB = null;
    } else if (hand.currentHand.length == 2) {
      _playerCardA = hand.currentHand[0];
      _playerCardB = hand.currentHand[1];
    } else {
      _playerCardA = null;
      _playerCardB = null;
    }
  }
}
