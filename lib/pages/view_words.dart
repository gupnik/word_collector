import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:word_collector/models/word.dart';
import 'package:word_collector/pages/add_word.dart';
import 'package:word_collector/components/word_list.dart';
import 'package:word_collector/pages/auth/sign_in_page.dart';
import 'package:word_collector/pages/auth/susi_page.dart';
import 'package:word_collector/repositories/word_repository.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class WCViewWordsPage extends StatefulWidget {
  @override
  _WCViewWordsPageState createState() => _WCViewWordsPageState();
}

class _WCViewWordsPageState extends State<WCViewWordsPage> {
  User _user;
  final List<WCWord> _words = [];

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  void initState() {
    _auth.userChanges().listen((event) => setState(() => _user = event));
    _loadWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Word Collector"),
          actions: [
            _user == null
                ? IconButton(
                    icon: Icon(Icons.person_add),
                    onPressed: () {
                      _pushPage(context, AuthTypeSelector());
                    })
                : IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: () {
                      _pushPage(context, SignInPage());
                    })
          ],
        ),
        body: WCWordList(_words, (WCWord word) {
          _deleteWord(word);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateAndDisplayWord(context);
          },
          tooltip: 'Add Word',
          child: Icon(Icons.add),
        ));
  }

  void _loadWords() async {
    final words = await WCWordRepository().words();
    setState(() {
      _words.addAll(words);
    });
  }

  void _deleteWord(WCWord word) async {
    await WCWordRepository().deleteWord(word.id);
    setState(() {
      _words.remove(word);
    });
  }

  void _addWord(WCWord word) async {
    final updatedWord = await WCWordRepository().insertWord(word);
    setState(() {
      _words.add(updatedWord);
    });
  }

  void _navigateAndDisplayWord(BuildContext context) async {
    final word = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WCAddWordPage()),
    );

    if (word == null) {
      return;
    }

    _addWord(word);

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Added ${word.name}')));
  }
}
