import '../card_model.dart';

class Mappers {
  static String mapSuit(int i) {
    switch (i) {
      case 0:
        return Suit.clubs;
      case 1:
        return Suit.hearts;
      case 2:
        return Suit.diamonds;
      case 3:
        return Suit.spades;
      default:
        throw RangeError("index value suit should be up to 3");
    }
  }

  static int mapRank(String rank) {
    if (rank == Ranks.pair) return 1;
    if (rank == Ranks.twoPairs) return 2;
    if (rank == Ranks.threeOfAKind) return 3;
    if (rank == Ranks.straight) return 4;
    if (rank == Ranks.flush) return 5;
    if (rank == Ranks.fullHouse) return 6;
    if (rank == Ranks.fourOfAkind) return 7;
    if (rank == Ranks.straightFlush) return 8;
    return 0;
  }
}
