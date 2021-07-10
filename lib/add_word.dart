import 'package:flutter/material.dart';

class WCAddWordPage extends StatelessWidget {
  final _wordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Word"),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                    controller: _wordNameController,
                    onChanged: (value) => {}))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_wordNameController.text.isNotEmpty) {
              Navigator.pop(context, _wordNameController.text);
            }
          },
          tooltip: 'Done',
          child: Icon(Icons.done),
        ));
  }
}
