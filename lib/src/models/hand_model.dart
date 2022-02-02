import 'dart:async';
import 'package:poker_odds_calculator/src/models/helpers/monte_carlo_runner.dart';
import 'package:poker_odds_calculator/src/models/probability_model.dart';

import 'card_model.dart';

class HandModel {

  int numberOfOponents;
  List<CardModel> currentHand;
  List<CardModel> communityCards;

  HandModel() {
    currentHand = [];
    communityCards = [];
    numberOfOponents = 1;
  }
  String currentRank;
  Probability probabilities;

  Future computeProbabilities() {
    
    return new Future(() => probabilities = MonteCarloSimulation.runSimulation(this));
  }
}
