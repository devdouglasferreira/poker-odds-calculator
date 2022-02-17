import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:collection/collection.dart';

class HandMatcher {
  static final List<List<int>> _straightReferences = [
    [2, 3, 4, 5, 6],
    [3, 4, 5, 6, 7],
    [4, 5, 6, 7, 8],
    [5, 6, 7, 8, 9],
    [6, 7, 8, 9, 10],
    [7, 8, 9, 10, 11],
    [8, 9, 10, 11, 12],
    [9, 10, 11, 12, 13],
    [10, 11, 12, 13, 14],
  ];

  static String getHandRank(List<CardModel> hand) {
    if (_checkStraightFlush(hand)) {
      return Ranks.straightFlush;
    } else if (_checkFourOfAKind(hand)) {
      return Ranks.fourOfAkind;
    } else if (_checkFullHouse(hand)) {
      return Ranks.fullHouse;
    } else if (_checkFlush(hand)) {
      return Ranks.flush;
    } else if (_checkStraight(hand)) {
      return Ranks.straight;
    } else if (_checkThreeOfAKind(hand)) {
      return Ranks.threeOfAKind;
    } else if (_checkTwoPair(hand)) {
      return Ranks.twoPairs;
    } else if (_checkPair(hand)) {
      return Ranks.pair;
    }

    return Ranks.highCard;
  }

  static bool _checkPair(List<CardModel> hand) => hand.groupListsBy((element) => element.value).entries.any((element) => element.value.length == 2);

  static bool _checkTwoPair(List<CardModel> hand) =>
      hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 2).length == 2;

  static bool _checkThreeOfAKind(List<CardModel> hand) =>
      hand.groupListsBy((element) => element.value).entries.any((element) => element.value.length == 3);

  static bool _checkStraight(List<CardModel> hand) => _straightReferences.any((i) => i.every((element) => hand.any((j) => j.value == element)));

  static bool _checkFlush(List<CardModel> hand) => hand.groupListsBy((element) => element.suit).entries.any((element) => element.value.length == 5);

  static bool _checkFullHouse(List<CardModel> hand) =>
      hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 2).length == 1 &&
      hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 3).length == 1;

  static bool _checkFourOfAKind(List<CardModel> hand) =>
      hand.groupListsBy((element) => element.value).entries.any((element) => element.value.length == 4);

  static bool _checkStraightFlush(List<CardModel> hand) {
    try {
      var flushGroup = hand.groupListsBy((element) => element.suit).entries.where((element) => element.value.length >= 5).single.value;
      var result = _straightReferences.any((i) => flushGroup.every((j) => i.contains(j.value)) && hand.length >= 5);
      return result;
    } catch (e) {
      return false;
    }
  }
}
