import 'package:flutter/material.dart';
import 'package:word_collector/models/word.dart';
import 'package:word_collector/pages/add_word.dart';
import 'package:word_collector/components/word_list.dart';

class WCViewWordsPage extends StatefulWidget {
  @override
  _WCViewWordsPageState createState() => _WCViewWordsPageState();
}

class _WCViewWordsPageState extends State<WCViewWordsPage> {
  final List<WCWord> _words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Word Collector"),
        ),
        body: WCWordList(_words),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateAndDisplayWord(context);
          },
          tooltip: 'Add Word',
          child: Icon(Icons.add),
        ));
  }

  void _navigateAndDisplayWord(BuildContext context) async {
    final word = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WCAddWordPage()),
    );

    setState(() {
      _words.add(word);
    });

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Added ${word.name}')));
  }
}