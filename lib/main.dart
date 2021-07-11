import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:word_collector/pages/view_words.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
