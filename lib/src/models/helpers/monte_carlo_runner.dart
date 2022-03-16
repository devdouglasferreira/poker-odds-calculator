import 'dart:collection';
import 'package:poker_odds_calculator/src/models/probability_model.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/hand_matcher.dart';

import '../card_model.dart';
import 'mappers.dart';

class SimulationMessage {
  late HandModel hand;
  late Probability results;
  late Map<String, double> outcomes;
  late double iterations;
}

class MonteCarloSimulation {
  static UnmodifiableListView<CardModel>? _referenceDeck;
  static UnmodifiableListView<CardModel> get referenceDeck => _referenceDeck ?? _generateReferenceDeck();

  static Probability runSimulation(HandModel hand, {int executions = 10000}) {
    return _simulateScenarios(hand, executions);
  }

  static Probability _simulateScenarios(HandModel hand, int iterations) {
    List<CardModel> currentDeck;
    List<CardModel> localPlayerHand;
    List<CardModel> localCommunity;
    Map<String, int> outcomes = <String, int>{};
    Map<int, List<CardModel>> virtualOpponent;
    String playerResult;
    int playerRank;
    List<int> opponentsRank;

    for (int i = 0; i < iterations; i++) {

      currentDeck = referenceDeck.toList();
      localPlayerHand = [];
      localCommunity = [];
      virtualOpponent = <int, List<CardModel>>{};
      opponentsRank = [];

      localPlayerHand.addAll(hand.currentHand);
      localCommunity.addAll(hand.communityCards);

      currentDeck.removeWhere((i) => localPlayerHand.any((j) => j.suit == i.suit && j.value == i.value));
      currentDeck.shuffle();

      localCommunity.addAll(currentDeck.take(5 - localCommunity.length));

      for (int i = 0; i < hand.numberOfOponents; i++) {

        List<CardModel> x = [];

        x.addAll(currentDeck.take(2));
        x.addAll(localCommunity);
        opponentsRank.add(Mappers.mapRank(HandMatcher.getHandRank(x)));
        virtualOpponent.putIfAbsent(i, () => x);
      }

      localPlayerHand.addAll(localCommunity);
      playerResult = HandMatcher.getHandRank(localPlayerHand);
      playerRank = Mappers.mapRank(playerResult);

      if (!opponentsRank.any((element) => element > playerRank)) {
        outcomes.update("Wins", (x) => ++x, ifAbsent: () => 1);
      } else if (opponentsRank.any((element) => element == playerRank)) {
        int tiedOpponent = opponentsRank.indexOf(opponentsRank.where((x) => x == playerRank).first);
        virtualOpponent[tiedOpponent]!.sort((a, b) => a.value.compareTo(b.value));
        localPlayerHand.sort((a, b) => a.value.compareTo(b.value));
        if (virtualOpponent[tiedOpponent]!.last.value < localPlayerHand.last.value) {
          outcomes.update("Wins", (x) => ++x, ifAbsent: () => 1);
        } else if (virtualOpponent[tiedOpponent]!.last.value == localPlayerHand.last.value) {
          outcomes.update("Ties", (x) => ++x, ifAbsent: () => 1);
        }
      }

      outcomes.update(playerResult, (x) => ++x, ifAbsent: () => 1);
    }
    return _calculateProbability(outcomes, iterations);
  }

  
  static Probability _calculateProbability(Map<String, int> outcomes, int iterations) {
    Probability p = Probability();
    p.scenarios = iterations;      
    p.probabilityToHighCard = (outcomes[Ranks.highCard] ?? 0.0) / p.scenarios;
    p.probabilityToPair = (outcomes[Ranks.pair] ?? 0.0) / p.scenarios;
    p.probabilityToTwoPairs = (outcomes[Ranks.twoPairs] ?? 0.0) / p.scenarios;
    p.probabilityToThreeOfAKind = (outcomes[Ranks.threeOfAKind] ?? 0.0) / p.scenarios;
    p.probabilityToStraight = (outcomes[Ranks.straight] ?? 0.0) / p.scenarios;
    p.probabilityToFlush = (outcomes[Ranks.flush] ?? 0.0) / p.scenarios;
    p.probabilityToFullHouse = (outcomes[Ranks.fullHouse] ?? 0.0) / p.scenarios;
    p.probabilityToFourOfAKind = (outcomes[Ranks.fourOfAkind] ?? 0.0) / p.scenarios;
    p.probabilityToStraightFlush = (outcomes[Ranks.straightFlush] ?? 0.0) / p.scenarios;
    p.winProbability = (outcomes["Wins"] ?? 0.0) / p.scenarios;
    p.tieProbability = (outcomes["Ties"] ?? 0.0) / p.scenarios;

    return p;
  }

  static UnmodifiableListView<CardModel> _generateReferenceDeck() {
    List<CardModel> l = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 2; j <= 14; j++) {
        l.add(CardModel.keyless(j, Mappers.mapSuit(i)));
      }
    }
    _referenceDeck = UnmodifiableListView(l);
    return _referenceDeck!;
  }
}
