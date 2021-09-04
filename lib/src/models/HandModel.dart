import 'CardModel.dart';

class HandModel {
  int numberOfOponents;
  List<CardModel> currentHand;
  List<CardModel> communityCards;

  HandModel() {
    currentHand = [];
    communityCards = [];
    numberOfOponents = 1;
  }

  double probabilityToToWin;
  double probabilityOfTie;

  double probabilityToStraightFlush;
  double probabilityToFourOfAKind;
  double probabilityToFullHouse;
  double probabilityToFlush;
  double probabilityToStraight;
  double probabilityToThreeOfAKind;
  double probabilityToTwoPairs;
  double probabilityToOnePair;
  double probabiliyToHighCard;

  double computeProbabilityToStraightFlush() {
    return 0.0;
  }

  double computeProbabilityToFourOfAKind() {
    return 0.0;
  }

  double computeProbabilityToFullHouse() {
    return 0.0;
  }

  double computeProbabilityToFlush() {
    return 0.0;
  }

  double computeProbabilityToStraight() {
    return 0.0;
  }

  double computeProbabilityToThreeOfAKind() {
    return 0.0;
  }

  double computeProbabilityToTwoPairs() {
    return 0.0;
  }

  double computeProbabilityToOnePair() {
    return 0.0;
  }

  double computeProbabilityToHighCard() {
    return 0.0;
  }

  double computeProbabilityToWin() {
    return 0.0;
  }

  double computeProbabilityToTie() {
    return 0.0;
  }
}
