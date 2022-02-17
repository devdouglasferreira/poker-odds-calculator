import 'dart:async';
import 'package:poker_odds_calculator/src/blocs/deck_bloc.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/hand_matcher.dart';
import 'package:poker_odds_calculator/src/models/helpers/round.dart';
import 'package:poker_odds_calculator/src/models/probability_model.dart';

class HandBloc {
  List<CardModel> _selectedPlayerCards = [];
  List<CardModel> _selectedCommunityCards = [];

  HandModel hand;
  String currentRound = Rounds.preflop;

  HandBloc(this.hand);

  final StreamController<HandModel> handStateController = StreamController<HandModel>.broadcast();

  StreamSink<HandModel> get handSink => handStateController.sink;
  Stream<HandModel> get handStream => handStateController.stream;

  List<CardModel> get selectedComunityCards => _selectedCommunityCards;
  List<CardModel> get selectedPlayerCards => _selectedPlayerCards;

  Future selectCardToHand(DeckBloc deck, int cardIndex) async {
    CardModel card = deck.cardDeck![cardIndex];
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

    _updatePlayerHandCard();
    _updateCommunityCard();

    handSink.add(hand);

    await updateCurrentRound();
  }

  void addOpponent() {
    if (hand.numberOfOponents < 9) {
      hand.numberOfOponents++;
      handSink.add(hand);
    }
  }

  void removeOpponent() {
    if (hand.numberOfOponents > 1) {
      hand.numberOfOponents--;
      handSink.add(hand);
    }
  }

  Future updateCurrentRound() async {
    if (hand.communityCards.isEmpty) {
      currentRound = Rounds.preflop;
      if (hand.currentHand.length == 2) await hand.computeProbabilities();
    } else if (hand.communityCards.length < 4) {
      currentRound = Rounds.flop;
      if (hand.communityCards.length == 3) await hand.computeProbabilities();
    } else if (hand.communityCards.length < 5) {
      currentRound = Rounds.turn;
      await hand.computeProbabilities();
    } else {
      await hand.computeProbabilities();
      currentRound = Rounds.river;
    }

    hand.currentRank = HandMatcher.getHandRank(hand.currentHand + hand.communityCards);
    handSink.add(hand);
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

  void close() {
    handStateController.close();
  }
}
