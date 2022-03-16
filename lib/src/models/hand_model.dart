import 'dart:core';
import 'dart:isolate';
import 'package:poker_odds_calculator/src/models/helpers/monte_carlo_runner.dart';
import 'package:poker_odds_calculator/src/models/probability_model.dart';
import 'card_model.dart';

class HandModel {
  int numberOfOponents = 1;
  int simulationsCount = 10000;
  bool computing = false;
  List<CardModel> currentHand = [];
  List<CardModel> communityCards = [];
  Probability probability = Probability();
  String? currentRank;

  Future computeProbabilities() async {
    
    final p = ReceivePort();
    computing = true;
    await Isolate.spawn(_runIsolated, p.sendPort);
    probability = await p.first as Probability;
    computing = false;
  }
  
  void _runIsolated(SendPort p) {
    var probabilities = MonteCarloSimulation.runSimulation(this, executions: simulationsCount);
    Isolate.exit(p, probabilities);
  }
}
