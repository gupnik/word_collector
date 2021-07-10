class WCWord {
  final int id;
  final String name;
  final String meaning;

  WCWord(this.name, {this.id, this.meaning = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meaning': meaning,
    };
  }

  @override
  String toString() {
    return 'WCWord{id: $id, name: $name, meaning: $meaning}';
  }
}
