import 'package:flutter/material.dart';
import 'package:word_collector/pages/view_words.dart';

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
      home: WCViewWordsPage(),
    );
  }
}
