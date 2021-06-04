import 'package:flutter/material.dart';

class WCAddWordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Word"),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(onChanged: (value) => {}))),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Done',
          child: Icon(Icons.done),
        ));
  }
}
