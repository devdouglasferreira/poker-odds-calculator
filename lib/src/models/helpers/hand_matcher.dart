import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:collection/collection.dart';
import 'package:tuple/tuple.dart';

class HandMatcher {
  static List<List<int>> _straightReferences = [
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

  static Tuple2<String, List<CardModel>> getHandRank(List<CardModel> hand) {
    if (_checkStraightFlush(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.straightFlush, _showdownStraightFlush(hand));
    } else if (_checkFourOfAKind(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.fourOfAkind, _showdownFourOfAKind(hand));
    } else if (_checkFullHouse(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.fullHouse, _showdownFullHouse(hand));
    } else if (_checkFlush(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.flush, _showdownFlush(hand));
    } else if (_checkStraight(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.straight, _showdownStraight(hand));
    } else if (_checkThreeOfAKind(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.threeOfAKind, _showdownThreeOfAKind(hand));
    } else if (_checkTwoPair(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.twoPairs, _showdownTwoPairs(hand));
    } else if (_checkPair(hand)) {
      return Tuple2<String, List<CardModel>>(Ranks.pair, _showdownPair(hand));
    }

    return Tuple2<String, List<CardModel>>(Ranks.highCard, _showdownHighCard(hand));
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

  static List<CardModel> _showdownHighCard(List<CardModel> hand) {
    List<CardModel> finalHand = [];
    finalHand.addAll(hand.sorted((a, b) => a.value.compareTo(b.value)).reversed.take(5));
    return finalHand;
  }

  static List<CardModel> _showdownTwoPairs(List<CardModel> hand) {}

  static List<CardModel> _showdownPair(List<CardModel> hand) {}

  static List<CardModel> _showdownThreeOfAKind(List<CardModel> hand) {}

  static List<CardModel> _showdownStraight(List<CardModel> hand) {}

  static List<CardModel> _showdownFlush(List<CardModel> hand) {
    List<CardModel> finalHand = [];
    finalHand.addAll(hand
        .groupListsBy((element) => element.suit)
        .entries
        .firstWhere((element) => element.value.length >= 5)
        .value
        .sorted((a, b) => a.value.compareTo(b.value))
        .reversed
        .take(5));
    return finalHand;
  }

  static List<CardModel> _showdownFullHouse(List<CardModel> hand) {
    List<CardModel> finalHand = [];
    finalHand.addAll(hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 2).single.value);
    finalHand.addAll(hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 3).single.value);
    return finalHand;
  }

  static List<CardModel> _showdownFourOfAKind(List<CardModel> hand) {
    List<CardModel> finalHand = [];
    var match = hand.groupListsBy((element) => element.value).entries.where((element) => element.value.length == 4);
    finalHand.addAll(match.single.value);
    finalHand.add(hand.sorted((a, b) => a.value.compareTo(b.value)).reversed.firstWhere((element) => !match.contains(element)));
    return finalHand;
  }

  static List<CardModel> _showdownStraightFlush(List<CardModel> hand) {}
}
