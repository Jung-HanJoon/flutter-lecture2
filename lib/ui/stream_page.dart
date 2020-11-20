import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {

  Stream<int> countStream(){
    var controller = StreamController();
    controller.add(1);
    return controller.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: countStream(),
        builder: null);
  }
}
