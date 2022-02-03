import 'dart:async';
import 'dart:collection';

import 'package:poker_odds_calculator/src/models/probability_model.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/hand_matcher.dart';

import '../card_model.dart';
import 'mappers.dart';

class MonteCarloSimulation {
  static UnmodifiableListView<CardModel> _referenceDeck;
  static UnmodifiableListView<CardModel> get referenceDeck => _referenceDeck ?? _generateReferenceDeck();

  static Future<Probability> runSimulation(HandModel hand, {int executions = 50000}) async {
    Probability results = new Probability();
    var outcomes = new Map<String, double>();

    for (int i = 0; i < executions; i++) {
      var currentDeck = referenceDeck.toList();
      List<CardModel> localPlayerHand = [];
      List<CardModel> localCommunity = [];
      Map<int, List<CardModel>> virtualOpponent = Map();

      localPlayerHand.addAll(hand.currentHand);
      localCommunity.addAll(hand.communityCards);

      currentDeck.removeWhere((i) => localPlayerHand.any((j) => j.suit == i.suit && j.value == i.value));
      currentDeck.shuffle();

      for (int i = 0; i < hand.numberOfOponents; i++) {
        List<CardModel> x = [];
        x.add(currentDeck.removeLast());
        x.add(currentDeck.removeLast());
        virtualOpponent.putIfAbsent(i, () => x);
      }

      if (localCommunity.length < 5) {
        for (int i = localCommunity.length; i < 5; i++) localCommunity.add(currentDeck.removeLast());
      }

      localPlayerHand.addAll(localCommunity);
      var playerResult = HandMatcher.getHandRank(localPlayerHand);

      results.scenarios++;
      outcomes.update(playerResult.item1, (x) => ++x, ifAbsent: () => 1);
    }

    _calculateProbability(results, outcomes);

    return await Future.value(results);
  }

  static UnmodifiableListView<CardModel> _generateReferenceDeck() {
    List<CardModel> l = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 2; j <= 14; j++) {
        l.add(CardModel.keyless(j, Mappers.mapSuit(i)));
      }
    }
    _referenceDeck = UnmodifiableListView(l);
    return _referenceDeck;
  }

  static void _calculateProbability(Probability p, Map<String, double> outcomes) {
    p.probabilityToHighCard = (outcomes[Ranks.highCard] ?? 0.0) / p.scenarios;
    p.probabilityToPair = (outcomes[Ranks.pair] ?? 0.0) / p.scenarios;
    p.probabilityToTwoPairs = (outcomes[Ranks.twoPairs] ?? 0.0) / p.scenarios;
    p.probabilityToThreeOfAKind = (outcomes[Ranks.threeOfAKind] ?? 0.0) / p.scenarios;
    p.probabilityToStraight = (outcomes[Ranks.straight] ?? 0.0) / p.scenarios;
    p.probabilityToFlush = (outcomes[Ranks.flush] ?? 0.0) / p.scenarios;
    p.probabilityToFullHouse = (outcomes[Ranks.fullHouse] ?? 0.0) / p.scenarios;
    p.probabilityToFourOfAKind = (outcomes[Ranks.fourOfAkind] ?? 0.0) / p.scenarios;
    p.probabilityToStraightFlush = (outcomes[Ranks.straightFlush] ?? 0.0) / p.scenarios;
  }
}
