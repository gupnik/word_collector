import 'package:flutter/material.dart';
import 'package:word_collector/models/word.dart';

class WCAddWordPage extends StatelessWidget {
  final _wordNameController = TextEditingController();

  final _wordMeaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Word"),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Word"),
                      TextField(
                          controller: _wordNameController,
                          onChanged: (value) => {}),
                      SizedBox(height: 50),
                      Text("Meaning"),
                      TextField(
                          controller: _wordMeaningController,
                          onChanged: (value) => {})
                    ]))),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_wordNameController.text.isNotEmpty) {
              final word = WCWord(_wordNameController.text,
                  meaning: _wordMeaningController.text);
              Navigator.pop(context, word);
            }
          },
          tooltip: 'Done',
          child: Icon(Icons.done),
        ));
  }
}
