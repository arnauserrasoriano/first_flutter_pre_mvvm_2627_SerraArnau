import 'dart:collection';

import 'package:first_flutter/data/models/sentence.dart';
import 'package:first_flutter/data/services/sentence_service.dart';

class SentenceRepository {
  SentenceRepository({SentenceService? sentenceService})
    : _sentenceService = sentenceService ?? SentenceService();

  final SentenceService _sentenceService;
  final List<Sentence> _favorites = [];
  final List<Sentence> _history = [];

  late Sentence _current = _sentenceService.getNext();

  List<Sentence> get history => UnmodifiableListView(_history);
  List<Sentence> get favorites => UnmodifiableListView(_favorites);
  Sentence get current => _current;

  Sentence getNext() {
    _history.insert(0, _current);
    _current = _sentenceService.getNext();
    return _current;
  }

  void toggleFavorite(Sentence sentence) {
    if (_favorites.contains(sentence)) {
      _favorites.remove(sentence);
    } else {
      _favorites.add(sentence);
    }
  }

  bool isFavorite(Sentence sentence) => _favorites.contains(sentence);
}
