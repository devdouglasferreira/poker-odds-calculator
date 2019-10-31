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
        Row(children: <Widget>[
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("2"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("3"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("4"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("5"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("6"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("7"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("8"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("9"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("10"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("J"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("Q"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("K"), color: Colors.white, onPressed: () => buttonCall)))
        ]),
        Row(children: <Widget>[
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("2"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("3"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("4"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("5"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("6"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("7"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("8"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("9"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("10"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("J"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("Q"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("K"), color: Colors.white, onPressed: () => buttonCall)))
        ]),
        Row(children: <Widget>[
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("2"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("3"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("4"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("5"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("6"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("7"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("8"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("9"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("10"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("J"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("Q"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("K"), color: Colors.white, onPressed: () => buttonCall)))
        ]),
        Row(children: <Widget>[
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("2"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("3"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("4"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("5"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("6"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("7"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("8"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("9"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("10"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("J"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("Q"), color: Colors.white, onPressed: () => buttonCall))),
          Flexible(flex: 3, child: AspectRatio(aspectRatio: 0.66, child: MaterialButton(child: Text("K"), color: Colors.white, onPressed: () => buttonCall)))
        ])
      ],
    );
  }

  void buttonCall() {}
}
