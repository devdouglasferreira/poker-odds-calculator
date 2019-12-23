import 'dart:async';
import 'package:poker_odds_calculator/src/models/CardModel.dart';
import 'package:poker_odds_calculator/src/models/HandModel.dart';

class HandBloc {
  
  HandModel hand;

  HandBloc(){
    hand = new HandModel();
  }
  
  final StreamController<HandModel> _handStateController = StreamController<HandModel>.broadcast();
  
  StreamSink<HandModel> get handInputs => _handStateController.sink;
  Stream<HandModel> get handOutputs => _handStateController.stream;

  void selectCard(CardModel card){
    if (hand.currentHand.length < 2)
      hand.currentHand.add(card);
    else 
      hand.communityCards.add(card);
    
    handInputs.add(hand);
  }

  void addOpponent(){
    hand.numberOfOponents++;
    handInputs.add(hand);
  }

  void removeOpponent(){
    if(hand.numberOfOponents > 0)
    hand.numberOfOponents--;
    handInputs.add(hand);
  }

  void close(){
    _handStateController.close();
  }

}