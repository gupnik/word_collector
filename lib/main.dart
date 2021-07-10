import 'package:flutter/material.dart';
import 'package:word_collector/add_word.dart';
import 'package:word_collector/word_list.dart';

void main() {
  runApp(WCApp());
}

class WCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Collector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WCHomePage(),
    );
  }
}

class WCHomePage extends StatefulWidget {
  @override
  _WCHomePageState createState() => _WCHomePageState();
}

class _WCHomePageState extends State<WCHomePage> {
  final List<String> _words = [];

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
      ..showSnackBar(SnackBar(content: Text('Added $word')));
  }
}
