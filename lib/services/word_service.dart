import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_collector/models/word.dart';

class WCWordService {
  final _wordsCollection = FirebaseFirestore.instance.collection('words');

  Future<List<WCWord>> words() async {
    final snapShot = await _wordsCollection.get();
    final maps = snapShot.docs;

    return List.generate(maps.length, (i) {
      return WCWord(maps[i]['name'],
          id: maps[i]['id'], meaning: maps[i]['meaning']);
    });
  }

  Future<void> addWord(WCWord word) async {
    return _wordsCollection
        .add(word.toMap())
        .then((value) => print("Word Added: ${value.id}"))
        .catchError((error) => print("Failed to add word: $error"));
  }
}
