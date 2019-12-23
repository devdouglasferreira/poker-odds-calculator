import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardDeckComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardDeckComponentState();
  }
}

class CardDeckComponentState extends State<CardDeckComponent> {
  @override
  void initState() {
    super.initState();
    return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: fillSuitRow('clubs')),
        Row(children: fillSuitRow('diamonds')),
        Row(children: fillSuitRow('spades')),
        Row(children: fillSuitRow('hearts'))
      ],
    );
  }

  List<Widget> fillSuitRow(String suitName){
    List<Widget> suitRow = new List<Widget>();
    for (int i = 2; i < 15; i++){
      suitRow.add(Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: FlatButton(onPressed: null, padding: EdgeInsets.all(0.0), child: Image.asset('assets/images/${suitName}_${i.toString()}.png')))));
    }
    return suitRow;
  }

  void buttonCall() {}
}
