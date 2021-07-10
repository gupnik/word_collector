import 'package:flutter/material.dart';
import 'package:word_collector/models/word.dart';

class WCWordList extends StatelessWidget {
  final List<WCWord> _words;

  WCWordList(this._words) : super();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          final word = _words[index];

          return ListTile(
              title: Text('${word.name}'), subtitle: Text('${word.meaning}'));
        });
  }
}
