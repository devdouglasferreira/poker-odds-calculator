import 'package:flutter/material.dart';

class CardModel {
  int value;
  String suit;
  Key? key;
  bool isSelected = false;

  CardModel(this.value, this.suit, this.key);

  CardModel.keyless(this.value, this.suit);
}

class Suit {
  static String diamonds = 'diamonds';
  static String clubs = 'clubs';
  static String hearts = 'hearts';
  static String spades = 'spades';
}

class Ranks {
  static String highCard = 'High Card';
  static String pair = 'Pair';
  static String twoPairs = 'Two Pairs';
  static String threeOfAKind = 'Three of a Kind';
  static String straight = 'Straight';
  static String flush = 'Flush';
  static String fullHouse = 'Full House';
  static String fourOfAkind = 'Four of a Kind';
  static String straightFlush = 'Straight Flush';
}
