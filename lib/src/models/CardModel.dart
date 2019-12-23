import 'package:flutter/material.dart';

class CardModel {
  int value;
  String suit;
  Key key;

  CardModel(int value, String suit, Key key){
    this.value = value;
    this.suit = suit;
    this.key = key;
  }
}

class Suit {
  static String diamonds = 'diamonds';
  static String clubs = 'clubs';
  static String hearts = 'hearts';
  static String spades = 'spades';
}
