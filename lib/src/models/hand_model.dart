import 'dart:async';
import 'dart:isolate';
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

  Future<Probability> computeProbabilities() async {
    final p = ReceivePort('Monte Carlo Simulation');

    await Isolate.spawn(_runIsolated, p.sendPort);
    return await p.first as Probability;
  }

  void _runIsolated(SendPort p) async {
    var probabilities = await MonteCarloSimulation.runSimulation(this);
    Isolate.exit(p, probabilities);
  }
}
