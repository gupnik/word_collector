import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_collector/models/word.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WCWordService {
  var _wordsCollection;

  WCWordService() {
    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null) {
        _wordsCollection = FirebaseFirestore.instance
            .collection("users")
            .doc(event.uid)
            .collection('words');
      }
    });
  }

  Future<List<WCWord>> words() async {
    if (_wordsCollection == null) {
      return [];
    }

    final snapShot = await _wordsCollection.get();
    final maps = snapShot.docs;

    return List.generate(maps.length, (i) {
      return WCWord(maps[i]['name'],
          id: maps[i]['id'], meaning: maps[i]['meaning']);
    });
  }

  Future<void> addWord(WCWord word) async {
    if (_wordsCollection == null) {
      return;
    }

    return _wordsCollection
        .add(word.toMap())
        .then((value) => print("Word Added: ${value.id}"))
        .catchError((error) => print("Failed to add word: $error"));
  }
}
