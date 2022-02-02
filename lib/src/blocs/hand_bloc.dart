import 'dart:async';
import 'package:poker_odds_calculator/src/blocs/deck_block.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/round.dart';

class HandBloc {
  List<CardModel> _selectedPlayerCards = [];
  List<CardModel> _selectedCommunityCards = [];

  HandModel hand;
  String currentRound = Rounds.preflop;

  HandBloc() {
    hand = new HandModel();
  }

  final StreamController<HandModel> _handStateController = StreamController<HandModel>.broadcast();

  StreamSink<HandModel> get handSink => _handStateController.sink;
  Stream<HandModel> get handStream => _handStateController.stream;

  List<CardModel> get selectedComunityCards => _selectedCommunityCards;
  List<CardModel> get selectedPlayerCards => _selectedPlayerCards;

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
    _updateCommunityCard();
    _updateCurrentRound();
  }

  void addOpponent() {
    if (hand.numberOfOponents < 9) {
      hand.numberOfOponents++;
      handSink.add(hand);
    }
  }

  void removeOpponent() {
    if (hand.numberOfOponents > 1) hand.numberOfOponents--;
    handSink.add(hand);
  }

  void close() {
    _handStateController.close();
  }

  void _updateCurrentRound() {
    if (hand.communityCards.length < 1) {
      currentRound = Rounds.preflop;
      if (hand.currentHand.length == 2) 
      hand.computeProbabilities();
    } else if (hand.communityCards.length < 4) {
      currentRound = Rounds.flop;
      if (hand.communityCards.length == 3) hand.computeProbabilities();
    } else if (hand.communityCards.length < 5) {
      currentRound = Rounds.turn;
      hand.computeProbabilities();
    } else {
      hand.computeProbabilities();
      currentRound = Rounds.river;
    }
  }

  void _updatePlayerHandCard() {
    _selectedPlayerCards = [];
    if (hand.currentHand.isNotEmpty) {
      for (int i = 0; i < hand.currentHand.length; i++) {
        _selectedPlayerCards.add(hand.currentHand[i]);
      }
    }
  }

  void _updateCommunityCard() {
    _selectedCommunityCards = [];
    if (hand.communityCards.isNotEmpty) {
      for (int i = 0; i < hand.communityCards.length; i++) {
        _selectedCommunityCards.add(hand.communityCards[i]);
      }
    }
  }
}
