import 'package:flutter/material.dart';

class WCWordList extends StatelessWidget {
  final List<String> _words;

  WCWordList(this._words) : super();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          final word = _words[index];

          return ListTile(title: Text('$word'));
        });
  }
}
