// lib/presentation/viewmodels/sentence_vm.dart
import 'package:first_flutter/data/repositories/sentence_repository.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/sentence.dart';
import '../../data/repositories/sentence_repository.dart';

// lib/presentation/viewmodels/sentence_vm.dart
class SentenceVM extends ChangeNotifier {
  final SentenceRepository _sentenceRepository;
  SentenceVM({SentenceRepository? sentenceRepository})
    : _sentenceRepository = sentenceRepository ?? SentenceRepository();
  // Getters
  Sentence get current => _sentenceRepository.current;
  List<Sentence> get history => _sentenceRepository.history;
  List<Sentence> get favorites => _sentenceRepository.favorites;

  void next() {
    _sentenceRepository.getNext();
    notifyListeners();
  }

  void toggleFavorite(Sentence sentence) {
    _sentenceRepository.toggleFavorite(sentence);
    notifyListeners();
  }

  bool isFavorite(Sentence pair) {
    return _sentenceRepository.isFavorite(pair);
  }

  void toggleCurrentFavorite() {
    toggleFavorite(current);
  }
}
