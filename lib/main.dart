import 'package:flutter/material.dart';

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
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
          tooltip: 'Add Word',
          child: Icon(Icons.add),
        ));
  }
}
