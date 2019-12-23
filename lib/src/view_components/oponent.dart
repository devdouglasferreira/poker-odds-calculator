import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/HandBloc.dart';

class OpponentComponent extends StatefulWidget {
  
  HandBloc _handBloc;

  OpponentComponent(HandBloc handBloc){
    this._handBloc = handBloc;
  }

  @override
  State<StatefulWidget> createState() {
    return OpponentComponentState(_handBloc);
  }
}

class OpponentComponentState extends State<OpponentComponent> {

  HandBloc _handBloc;

  OpponentComponentState(HandBloc handBloc){
    this._handBloc = handBloc;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}