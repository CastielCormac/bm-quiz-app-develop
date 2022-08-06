import 'package:bm_quiz_app/models/question_model.dart';
import 'package:bm_quiz_app/service/service.dart';
import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  List<Question>? _questions = [];
  bool _loading = false;
  int _score = 0;
  int _totalScore = 0;
  String _name = "";

  List<Question>? get questions => _questions;
  bool get loading => _loading;
  int get score => _score;
  int get totalScore => _totalScore;
  String get name => _name;

  set setScore(int score) {
    _score = score;
  }

  set setTotalScore(int totalScore) {
    _totalScore = totalScore;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  getQuestions(String scannerResult) async {
    _questions = await fetchQuestions(scannerResult);

    notifyListeners();
  }

  resetScore() {
    _score = 0;
    notifyListeners();
  }

  resetTotalScore() {
    _totalScore = 0;
    notifyListeners();
  }

  increaseScore() {
    _score++;
    notifyListeners();
  }

  decreaseScore() {
    _score--;
    notifyListeners();
  }
}
