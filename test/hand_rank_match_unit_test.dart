import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/hand_matcher.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';

void main() {
  test('Get \'Pair\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(10, Suit.spades));
    handModel.currentHand.add(CardModel.keyless(9, Suit.hearts));

    handModel.communityCards.add(CardModel.keyless(10, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(13, Suit.hearts));
    handModel.communityCards.add(CardModel.keyless(3, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(7, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(14, Suit.spades));

    List<CardModel> sevenCards = [];

    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.pair);
  });

  test('Get \'Two Pairs\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(14, Suit.clubs));
    handModel.currentHand.add(CardModel.keyless(5, Suit.diamonds));

    handModel.communityCards.add(CardModel.keyless(12, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(10, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(5, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(9, Suit.spades));
    handModel.communityCards.add(CardModel.keyless(14, Suit.diamonds));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.twoPairs);
  });

  test('Get \'Three of a Kind\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(3, Suit.spades));
    handModel.currentHand.add(CardModel.keyless(4, Suit.clubs));

    handModel.communityCards.add(CardModel.keyless(9, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(14, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(3, Suit.hearts));
    handModel.communityCards.add(CardModel.keyless(12, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(3, Suit.spades));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.threeOfAKind);
  });

  test('Get \'Straight\' Hand Rank', () {
    final handModel = HandModel();

    Random rand = Random();
    int minVal = rand.nextInt(7) + 4;
    handModel.currentHand.add(CardModel.keyless(minVal, Suit.spades));
    handModel.currentHand.add(CardModel.keyless(minVal + 1, Suit.clubs));

    handModel.communityCards.add(CardModel.keyless(2, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(minVal + 2, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(minVal + 3, Suit.hearts));
    handModel.communityCards.add(CardModel.keyless(minVal + 4, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(2, Suit.spades));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.straight);
  });

  test('Get \'Flush\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(8, Suit.hearts));
    handModel.currentHand.add(CardModel.keyless(2, Suit.hearts));

    handModel.communityCards.add(CardModel.keyless(7, Suit.hearts));
    handModel.communityCards.add(CardModel.keyless(14, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(9, Suit.hearts));
    handModel.communityCards.add(CardModel.keyless(10, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(12, Suit.hearts));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.flush);
  });

  test('Get \'Full House\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(11, Suit.hearts));
    handModel.currentHand.add(CardModel.keyless(11, Suit.diamonds));

    handModel.communityCards.add(CardModel.keyless(11, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(2, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(9, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(10, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(9, Suit.hearts));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.fullHouse);
  });

  test('Get \'Four of a Kind\' Hand Rank', () {
    final handModel = HandModel();

    handModel.currentHand.add(CardModel.keyless(12, Suit.hearts));
    handModel.currentHand.add(CardModel.keyless(12, Suit.diamonds));

    handModel.communityCards.add(CardModel.keyless(12, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(9, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(2, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(12, Suit.spades));
    handModel.communityCards.add(CardModel.keyless(7, Suit.hearts));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.fourOfAkind);
  });

  test('Get \'Straight Flush\' Hand Rank', () {
    final handModel = HandModel();

    var rand = Random();
    int minVal = rand.nextInt(7) + 4;
    handModel.currentHand.add(CardModel.keyless(minVal, Suit.clubs));
    handModel.currentHand.add(CardModel.keyless(minVal + 1, Suit.clubs));

    handModel.communityCards.add(CardModel.keyless(14, Suit.diamonds));
    handModel.communityCards.add(CardModel.keyless(minVal + 2, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(minVal + 3, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(minVal + 4, Suit.clubs));
    handModel.communityCards.add(CardModel.keyless(14, Suit.spades));

    List<CardModel> sevenCards = [];
    sevenCards.addAll(handModel.currentHand);
    sevenCards.addAll(handModel.communityCards);

    var result = HandMatcher.getHandRank(sevenCards);

    expect(result, Ranks.straightFlush);
  });
}
