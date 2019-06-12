import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Texas Hold'em Odds Calculator"))
    );
  }
}
