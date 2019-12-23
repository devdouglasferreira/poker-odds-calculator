class CardModel {
  int value;
  String suit;

  CardModel(int value, String suit){
    this.value = value;
    this.suit = suit;
  }
}

class Suit {
  static String diamonds = 'diamonds';
  static String clubs = 'clubs';
  static String hearts = 'hearts';
  static String spades = 'spades';
}
