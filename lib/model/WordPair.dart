class WordPair {
  final int id;
  final String english;
  final String turkish;

  WordPair({
    required this.id,
    required this.english,
    required this.turkish,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'english': english,
      'turkish': turkish,
    };
  }

  static WordPair fromMap(Map<String, dynamic> map) {
    return WordPair(
      id: map['id'],
      english: map['english'],
      turkish: map['turkish'],
    );
  }
}
