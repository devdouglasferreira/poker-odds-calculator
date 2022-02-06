import 'package:flutter_test/flutter_test.dart';
import 'package:poker_odds_calculator/src/models/card_model.dart';
import 'package:poker_odds_calculator/src/models/hand_model.dart';
import 'package:poker_odds_calculator/src/models/helpers/monte_carlo_runner.dart';

void main() {
  test('Monte Carlo Runner [Pre Flop]', () async {
    HandModel hand = HandModel();
    hand.currentHand = [CardModel.keyless(7, Suit.clubs), CardModel.keyless(11, Suit.hearts)];
    var result = await MonteCarloSimulation.runSimulation(hand);

    expect(result.scenarios, 100000);
  });

  test('Monte Carlo Runner [Flop]', () async {
    HandModel hand = HandModel();
    hand.currentHand = [CardModel.keyless(7, Suit.clubs), CardModel.keyless(11, Suit.hearts)];
    hand.communityCards = [CardModel.keyless(9, Suit.diamonds), CardModel.keyless(10, Suit.diamonds), CardModel.keyless(2, Suit.spades)];
    var result = await MonteCarloSimulation.runSimulation(hand);

    expect(result.scenarios, 100000);
  });

  test('Monte Carlo Runner [Turn]', () async {
    HandModel hand = HandModel();
    hand.currentHand = [CardModel.keyless(14, Suit.clubs), CardModel.keyless(14, Suit.hearts)];
    hand.communityCards = [
      CardModel.keyless(10, Suit.spades),
      CardModel.keyless(13, Suit.hearts),
      CardModel.keyless(9, Suit.hearts),
      CardModel.keyless(12, Suit.hearts)
    ];
    var result = await MonteCarloSimulation.runSimulation(hand);

    expect(result.scenarios, 100000);
  });

  test('Monte Carlo Runner [River]', () async {
    HandModel hand = HandModel();
    hand.currentHand = [CardModel.keyless(13, Suit.spades), CardModel.keyless(11, Suit.clubs)];
    hand.communityCards = [
      CardModel.keyless(14, Suit.diamonds),
      CardModel.keyless(6, Suit.spades),
      CardModel.keyless(12, Suit.clubs),
      CardModel.keyless(8, Suit.diamonds),
      CardModel.keyless(10, Suit.clubs),
    ];
    var result = await MonteCarloSimulation.runSimulation(hand);

    expect(result.scenarios, 100000);
  });
}
