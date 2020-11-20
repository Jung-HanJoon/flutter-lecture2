import 'package:flutter/material.dart';

class ListExamPage extends StatelessWidget {
  final items = [1,2,3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    return ListView(
      children: items.map((e) => Text('$e')).toList(),

    );
  }
}
