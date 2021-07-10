import 'package:flutter/material.dart';
import 'package:word_collector/add_word.dart';

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

class WCHomePage extends StatelessWidget {
  final snackBar = SnackBar(content: Text('Coming Soon!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Word Collector"),
        ),
        body: Center(child: Text("Collect Your Words Here...")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateAndDisplayWord(context);
          },
          tooltip: 'Add Word',
          child: Icon(Icons.add),
        ));
  }

  void _navigateAndDisplayWord(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WCAddWordPage()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
